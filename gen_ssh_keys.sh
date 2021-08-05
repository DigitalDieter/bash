GREEN="\033[01;32m"
BLUE="\033[01;34m"
RED="\033[01;31m"
WHITEB="\033[01;37m"
RESET="\033[00m"


if [[ "$(id -u)" -ne 0 ]]; then
printf "\n${RED}[+]${RESET}${WHITEB} Please, run this program as root! ${RESET}\n"
exit 1
fi

printf "\n${BLUE}[+]${RESET}${WHITEB} Generating  sshkeys (without password) ${RESET}\n"
if [[  ! -d /home/$(whoami)/.ssh ]]
then
sudo mkdir -p $HOME/$(whoami)/.ssh
sudo ssh-keygen -t rsa -o -a 100 -N "" -f $HOME/.ssh/$(whoami)
fi
