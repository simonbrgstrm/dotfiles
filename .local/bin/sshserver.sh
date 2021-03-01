#!/bin/bash

tmpfile=/tmp/sshserver
[[ -e $tmpfile ]] && . $tmpfile

#--------------------------------------------------------------------+
#Color picker, usage: printf ${BLD}${CUR}${RED}${BBLU}"Hello!)"${DEF}|
#-------------------------+--------------------------------+---------+
#       Text color        |       Background color         |         |
#-----------+-------------+--------------+-----------------+         |
# Base color|Lighter shade|  Base color  | Lighter shade   |         |
#-----------+-------------+--------------+-----------------+         |
BLK='\e[30m'; blk='\e[90m'; BBLK='\e[40m'; bblk='\e[100m' #| Black   |
RED='\e[31m'; red='\e[91m'; BRED='\e[41m'; bred='\e[101m' #| Red     |
GRN='\e[32m'; grn='\e[92m'; BGRN='\e[42m'; bgrn='\e[102m' #| Green   |
YLW='\e[33m'; ylw='\e[93m'; BYLW='\e[43m'; bylw='\e[103m' #| Yellow  |
BLU='\e[34m'; blu='\e[94m'; BBLU='\e[44m'; bblu='\e[104m' #| Blue    |
MGN='\e[35m'; mgn='\e[95m'; BMGN='\e[45m'; bmgn='\e[105m' #| Magenta |
CYN='\e[36m'; cyn='\e[96m'; BCYN='\e[46m'; bcyn='\e[106m' #| Cyan    |
WHT='\e[37m'; wht='\e[97m'; BWHT='\e[47m'; bwht='\e[107m' #| White   |
#----------------------------------------------------------+---------+
# Effects                                                            |
#--------------------------------------------------------------------+
DEF='\e[0m'   #Default color and effects                             |
BLD='\e[1m'   #Bold\brighter                                         |
DIM='\e[2m'   #Dim\darker                                            |
CUR='\e[3m'   #Italic font                                           |
UND='\e[4m'   #Underline                                             |
INV='\e[7m'   #Inverted                                              |
COF='\e[?25l' #Cursor Off                                            |
CON='\e[?25h' #Cursor On                                             |
#--------------------------------------------------------------------+
# Text positioning, usage: XY 10 10 "Hello World!"                   |
XY   () { printf "\e[${2};${1}H${3}"; } #                            |
#--------------------------------------------------------------------+
# Print line, usage: line - 10 | line -= 20 | line "Hello World!" 20 |
line () { printf -v LINE "%$2s"; printf -- "${LINE// /$1}"; } #      |
# Create sequence like {0..X}                                        |
cnt () { printf -v _N %$1s; _N=(${_N// / 1}); printf "${!_N[*]}"; } #|
#------------------------{ Yes to ssh }------------------------------+
ssh_yes () {
# If connecting first time send 'yes' on ssh's request.
# Expect must be installed on server. Options:
#   $1 - ssh address with parameters(if needed)
#
# Usage example:
#   ssh_yes "-p22 user@localhost"
expect << EOF
spawn ssh $1
expect {
    "(yes/no)?" {
        send "yes\n"
        expect {
            "assword:" { exit }
            "$ "       { send "exit\n" }
        }
    }
    "assword:" { exit }
    "$ "       { send "exit\n" }
}
exit
EOF
}

#------------------------{ Pause function }--------------------------------------------------------
pause () { printf "\n${BLD}"; read -p 'press any key to continue'; printf "\n${DEF}"; }

#------------------------{ SSH to target server }--------------------------------------------------
go_to_target () { clear; ssh $SSH_OPT $target || pause; }

#------------------------{ Exit function }---------------------------------------------------------
bye () { clear; exit 0; }; trap bye INT


#------------------------------{ Dialog functions }------------------------------------------------

#------------------------{ Switch menu mode to contents view or full list }------------------------
new_list () {
    list=(); match=
    for item in "${fullist[@]}"; {

        case         $item:$match in
                 -*\ *\ *-:1) break  ;;
           -*\ $filter\ *-:*) match=1;;
        esac
        [[ $match ]] && list+=( "$item" )
    }
    echo "filter='$filter'" > $tmpfile
}

contents_menu () {
	filter=$(dialog --output-fd 1 --ok-label "SELECT" --cancel-label "BACK" \
                    --no-items --menu "Select list of hosts:" 0 0 0 "All" "${content[@]}")
	case $filter:$? in
             All:0) list=( "${fullist[@]}" );;
               *:0) new_list;;
	esac;           first_dialog
}

#------------------------{ First dialog - Select host }--------------------------------------------
first_dialog () {
	target=$(dialog         \
					--ok-label "CONNECT" --cancel-label "EXIT" --colors \
                    --help-button --help-label  "CONTENTS" --output-fd 1 \
					--menu "Select host to connect to. $USERNOTE" 0 0 0 "${list[@]}")
	case $target:$? in
       -*\ *\ *-:*) first_dialog ;;
               *:0) go_to_target  ; first_dialog;;
               *:2) contents_menu;;
      	       *:3) second_dialog;;
      	       *:*) bye;;
  	esac
}

#------------------------{ Second dialog - Select command }----------------------------------------

#-------------{ Create hosts list. Get hosts and descriptions from ~/.ssh/config. }----------------
IFSOLD=$IFS; IFS=$'\n'; for host in $(grep -h "Host " ~/.ssh/config* | sed '/\*/d; s/Host //g;'); {

    name="${host// #*/}" # Get HostName
    desc="${host//*#/}"  # Get Description

    case $name in
        '#LABEL')
        desc="${host%\#*}"    ; desc="${desc##*\#}"
        name="{ $desc }"      ; length=$[ (40-${#name})/2 ]
        name=$( line - $length; printf  "$name"; line - $length )
        [[ ${#name} -lt 40 ]]  &&  name=-$name ; content+=( "$desc" ); desc=$(line - 20);;
        '#'*) continue;;
    esac

    fullist+=( "$name" "$desc" ) #Add HostName and Description to the list

}; IFS=$IFSOLD
list=( "${fullist[@]}" )
[[ $filter ]] && new_list

first_dialog; bye
