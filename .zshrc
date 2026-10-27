# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Aliases
# ---------------------------------------------------------
# cat
alias cat='bat'
alias catn='bat --style=plain'
alias catp='bat --paging=never'
alias catnp='bat --style=plain --paging=never'

# ls
alias ls='lsd --group-dirs=first'
alias tree='lsd --tree'
alias ll='lsd -l --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias lla='lsd -la --group-dirs=first'

# cls
alias cls='clear'

# grep
alias grep='grep --color=auto'

# tree
alias tree='lsd --tree --group-dirs=first'

# Impacket
alias smbserver='smbserver.py'
alias ntlmrelayx='ntlmrelayx.py'
alias psexec='psexec.py'
alias smbclient='smbclient.py'
alias getArch='getArch.py'

# External / Internal Tools
alias responder='/opt/Responder/Responder.py'
alias deepextract='/opt/Wolf/Tools/decompressor.sh'

alias fzf='/usr/bin/fzf --preview "/usr/bin/bat --color=always --style=numbers --line-range=:500 {}"'

# Bindings
# -------------------------------------------------------
# Home/End/Delete
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char


# Custom Functions
# -------------------------------------------------
# Set Target
function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > /home/RafaxWolf/.config/bin/target
}

# Clear Target
function cleartarget(){
    echo '' > /home/RafaxWolf/.config/bin/target
}


# Plugins
# -----------------------------------------------------------------------------------------------------

# ZSH AutoSuggestions Plugin
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ZSH Syntax Highlighting Plugin
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ZSH Sudo Plugin
if [ -f /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh ]; then
  source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
fi


# Use modern completion system
autoload -Uz compinit
compinit
 
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
 
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Created by `pipx` on 2025-02-10 05:53:23
export PATH="$PATH:~/.local/bin"
export MANPAGER="bat -plman"
