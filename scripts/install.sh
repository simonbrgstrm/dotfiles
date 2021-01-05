#!/bin/bash

log_file=~/install_progress_log.txt

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!" >> $log_file
fi

sudo apt-get -y install curl
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "curl FAILED TO INSTALL!" >> $log_file
fi

sudo apt-get -y install docker.io
if type -p docker.io > /dev/null; then
    echo "docker Installed" >> $log_file
else
    echo "docker FAILED TO INSTALL!" >> $log_file
fi


sudo apt-get -y install herbstluftwm
if type -p herbstluftwm > /dev/null; then
    echo "herbstluftwm Installed" >> $log_file
else
    echo "herbstluftwm FAILED TO INSTALL!" >> $log_file
fi

sudo apt-get -y install npm
if type -p npm > /dev/null; then
    echo "npm Installed" >> $log_file
else
    echo "npm FAILED TO INSTALL!" >> $log_file
fi

sudo apt-get -y install python-pip
if type -p pip3 > /dev/null; then
    echo "pip Installed" >> $log_file
else
    echo "pip FAILED TO INSTALL!" >> $log_file
fi

sudo apt-get -y install bpython
if type -p bpython > /dev/null; then
    echo "bpython Installed" >> $log_file
else
    echo "bpython FAILED TO INSTALL!" >> $log_file
fi

sudo apt-get -y install bpython3
if type -p bpython3 > /dev/null; then
    echo "bpython3 installed" >> $log_file
else
    echo "bpython3 failed to install!" >> $log_file
fi

sudo apt-get -y install nodejs
if type -p nodejs > /dev/null; then
    echo "nodejs installed" >> $log_file
else
    echo "nodejs failed to install!" >> $log_file
fi








# ---
# Install git-completion and git-prompt
# ---
cd ~/
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv ~/git-completion.bash ~/.git-completion.bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
echo "git-completion and git-prompt Installed and Configured" >> $log_file



echo -e "\n====== Summary ======\n"
echo
cat $log_file
echo
echo -e "\n====== Summary ======\n"
rm $log_file
