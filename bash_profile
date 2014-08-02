
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

. ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/sherzberg/.gvm/bin/gvm-init.sh" ]] && source "/Users/sherzberg/.gvm/bin/gvm-init.sh"
