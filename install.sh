#!/usr/bin/env bash
# _            _         _  _
#|_| ___  ___ | |_  ___ | || |
#| ||   ||_ -||  _|| .'|| || |
#|_||_|_||___||_|  |__,||_||_|
# ____________________________

set -Eeuo pipefail
IFS=$'\n\t'

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")" && pwd)"
readonly APT_LIST="$SCRIPT_DIR/apt.txt"
readonly TEMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/dotfiles-install.XXXXXX")"
readonly RESULTS_FILE="$TEMP_DIR/results.txt"
readonly POLYBAR_VERSION="${POLYBAR_VERSION:-3.7.2}"

cleanup() {
  if [[ -s "$RESULTS_FILE" ]]; then
    printf '\n------ Install results ------\n\n'
    cat "$RESULTS_FILE"
    printf '\n-----------------------------\n'
  fi
  rm -rf -- "$TEMP_DIR"
}
trap cleanup EXIT

record_result() {
  printf '%-10s %s\n' "$1" "$2" >> "$RESULTS_FILE"
}

fallback_package_for() {
  case "$1" in
    dmenu) echo "suckless-tools" ;;
    picom) echo "compton" ;;
    *) return 1 ;;
  esac
}

install_remote_script() {
  local name="$1"
  local interpreter="$2"
  local url="$3"
  local installer="$TEMP_DIR/$name.sh"
  shift 3

  curl --fail --silent --show-error --location "$url" --output "$installer"
  "$interpreter" "$installer" "$@"
  record_result "installed" "$name"
}

if [[ $EUID -eq 0 ]]; then
  printf 'Run this script as your regular user, not root.\n' >&2
  exit 1
fi

if [[ ! -r "$APT_LIST" ]]; then
  printf 'Package list not found: %s\n' "$APT_LIST" >&2
  exit 1
fi

if ! command -v apt-get >/dev/null || [[ ! -r /etc/os-release ]]; then
  printf 'This installer requires an Ubuntu system with apt-get.\n' >&2
  exit 1
fi

# shellcheck disable=SC1091
. /etc/os-release
if [[ ${ID:-} != "ubuntu" || -z ${VERSION_CODENAME:-} ]]; then
  printf 'This installer currently supports Ubuntu releases only.\n' >&2
  exit 1
fi

sudo -v
sudo install -d -m 0755 /etc/apt/keyrings

curl --fail --silent --show-error --location \
  https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.gpg \
  --output "$TEMP_DIR/spotify.gpg"
sudo gpg --dearmor --yes --output /etc/apt/keyrings/spotify.gpg "$TEMP_DIR/spotify.gpg"
printf '%s\n' \
  'deb [signed-by=/etc/apt/keyrings/spotify.gpg] https://repository.spotify.com stable non-free' |
  sudo tee /etc/apt/sources.list.d/spotify.list >/dev/null

sudo apt-get update
sudo apt-get install --yes ca-certificates curl gnupg software-properties-common
sudo add-apt-repository --yes universe
sudo add-apt-repository --yes multiverse

curl --fail --silent --show-error --location \
  https://download.docker.com/linux/ubuntu/gpg \
  --output "$TEMP_DIR/docker.asc"
sudo install -m 0644 "$TEMP_DIR/docker.asc" /etc/apt/keyrings/docker.asc
printf 'deb [arch=%s signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu %s stable\n' \
  "$(dpkg --print-architecture)" "$VERSION_CODENAME" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt-get update

declare -A seen_packages=()
failed_packages=0
while IFS= read -r package; do
  package="${package%%#*}"
  package="${package//[[:space:]]/}"
  [[ -z "$package" ]] && continue

  if [[ ! "$package" =~ ^[a-z0-9][a-z0-9+.-]*$ ]]; then
    printf 'Invalid package name in %s: %s\n' "$APT_LIST" "$package" >&2
    exit 1
  fi
  [[ ${seen_packages[$package]+_} ]] && continue
  seen_packages["$package"]=1

  if sudo apt-get install --yes "$package"; then
    record_result "installed" "$package"
    continue
  fi

  fallback_package=""
  if fallback_package="$(fallback_package_for "$package" 2>/dev/null || true)" &&
    [[ -n "$fallback_package" ]] &&
    sudo apt-get install --yes "$fallback_package"; then
    record_result "installed" "$package (via $fallback_package)"
  else
    record_result "failed" "$package"
    ((failed_packages += 1))
  fi
done < "$APT_LIST"

if ((failed_packages > 0)); then
  printf '%d package(s) failed to install; see results above.\n' "$failed_packages" >&2
  exit 1
fi

mkdir -p "$HOME/.config/herbstluftwm"

install_remote_script \
  spicetify sh https://raw.githubusercontent.com/spicetify/cli/main/install.sh
install_remote_script \
  oh-my-zsh sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --unattended
install_remote_script \
  starship sh https://starship.rs/install.sh --yes

polybar_archive="$TEMP_DIR/polybar-$POLYBAR_VERSION.tar.gz"
curl --fail --silent --show-error --location \
  "https://github.com/polybar/polybar/archive/refs/tags/$POLYBAR_VERSION.tar.gz" \
  --output "$polybar_archive"
tar -xzf "$polybar_archive" -C "$HOME"
record_result "downloaded" "polybar $POLYBAR_VERSION source to $HOME/polybar-$POLYBAR_VERSION"

if getent group docker >/dev/null; then
  sudo usermod -aG docker "$USER"
  record_result "configured" "added $USER to the docker group"
fi

if [[ ${SKIP_SYMLINK:-0} != "1" && -x "$SCRIPT_DIR/symlink.sh" ]]; then
  "$SCRIPT_DIR/symlink.sh"
  record_result "configured" "symlinked dotfiles"
fi
