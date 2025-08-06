# You can customize where you put it but it's generally recommended that you put in $HOME/.zplug
if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "lib/history", from:oh-my-zsh # support for history command
zplug "lib/completion", from:oh-my-zsh # support for completion
zplug "zsh-users/zsh-autosuggestions" # realtime autocomplete for zsh based on command history
zplug "Tarrasch/zsh-autoenv" # automatically setup env for projects
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3 # Syntax highlighting for commands, load last

# Actually install plugins, prompt user input
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export CASE_SENSITIVE=true

bindkey "^[[Z" autosuggest-accept
zplug load

# aliases
alias ssh_to_dev="ssh root@10.70.1.2"
alias ssh_to_prod="ssh root@10.70.0.3"

alias edit=micro
export VISUAL=micro
export EDITOR="$VISUAL"

autoload -Uz compinit && compinit
