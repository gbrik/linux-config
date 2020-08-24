source ~/.zsh_plugins.sh

export PATH=$HOME/.yarn/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export EDITOR='emacsclient -ta ""'
alias em='emacsclient -ta ""'
alias xclip="xclip -selection c"
alias spotify='spotify --disable-gpu'
alias chromium='chromium --disable-gpu'

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

eval $(dircolors -b ~/linux-config/.zsh/.dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
alias ls='ls --color'

export AUTO_NOTIFY_THRESHOLD=2
export AUTO_NOTIFY_TITLE='"%command" finished in %elapsed seconds'
export AUTO_NOTIFY_BODY=" "
AUTO_NOTIFY_IGNORE+=("em")

. $HOME/.asdf/asdf.sh

export PATH=$(go env GOPATH)/bin:$PATH

