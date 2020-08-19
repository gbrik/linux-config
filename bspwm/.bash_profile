#
# ~/.bash_profile

export PATH="$PATH:$HOME/scripts"
export PATH="$HOME/progtools/idea-IU/bin:$PATH"

export GOPATH=$HOME/cs/go
export PATH=$GOPATH/bin:$PATH

#

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
