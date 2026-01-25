# Linux/Debian aliases

###########################################
# PACKAGE MANAGEMENT (apt)
###########################################

alias apt-up='sudo apt update && sudo apt upgrade'
alias apt-search='apt-cache search'
alias apt-info='apt-cache show'
alias apt-install='sudo apt install'
alias apt-remove='sudo apt remove'
alias apt-autoremove='sudo apt autoremove'

###########################################
# SYSTEMD SERVICES
###########################################

alias sc='sudo systemctl'
alias scs='systemctl status'
alias scr='sudo systemctl restart'
alias sce='sudo systemctl enable'
alias scd='sudo systemctl disable'
alias sclog='journalctl -u'       # logs for a service
alias sclog-f='journalctl -fu'    # follow logs for a service

###########################################
# LOGS
###########################################

alias jlog='journalctl -xe'       # recent logs with context
alias jlog-f='journalctl -f'      # follow system logs
alias jlog-b='journalctl -b'      # logs since boot

###########################################
# SYSTEM INFO
###########################################

alias ports='ss -tulnp'           # listening ports
alias mem='free -h'               # memory usage
alias disk='df -h'                # disk usage
