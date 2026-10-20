# Powerlevel10k remains installed; this config uses a Kali-like prompt.

# Aliases
# ---------------------------------------------------------
# cat
alias cat='batcat --color=always'
alias catn='batcat --style=plain'
alias catp='batcat --paging=never'
alias catnp='batcat --style=plain --paging=never'

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

# Impacket
alias smbserver='smbserver.py'
alias ntlmrelayx='ntlmrelayx.py'
alias psexec='psexec.py'
alias smbclient='smbclient.py'
alias getArch='getArch.py'

# External / Internal Tools
alias responder='/opt/Responder/Responder.py'
alias deepextract='/opt/Wolf/Tools/decompressor.sh'

alias fzf='/usr/bin/fzf --preview "/usr/bin/batcat --color=always --style=numbers --line-range=:500 {}"'

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
    echo "$ip_address $machine_name" > "$HOME/.config/bin/target"
}

# Clear Target
function cleartarget(){
    echo '' > "$HOME/.config/bin/target"
}


# Zsh plugins shipped with Oh My Zsh.
ZSH="${ZSH:-$HOME/.oh-my-zsh}"
[[ -r "$ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ]] && source "$ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
[[ -r "$ZSH/plugins/history-substring-search/history-substring-search.plugin.zsh" ]] && source "$ZSH/plugins/history-substring-search/history-substring-search.plugin.zsh"
[[ -r "$ZSH/plugins/zsh-sudo/sudo.plugin.zsh" ]] && source "$ZSH/plugins/zsh-sudo/sudo.plugin.zsh"


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
# The Powerlevel10k config remains available for later restoration.

# Search history by the text already typed.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Color recognized commands cyan; keep unknown commands red.
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan'

# Load last so syntax highlighting can wrap all line-editor widgets.
[[ -r "$ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" ]] && source "$ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

autoload -Uz add-zsh-hook vcs_info
zstyle ':vcs_info:git:*' formats ' │  %b'
zstyle ':vcs_info:git:*' actionformats ' │  %b (%a)'
add-zsh-hook precmd vcs_info
setopt prompt_subst

PROMPT='%F{blue}┌──(%F{green}%n㉿%m%F{blue})-[%F{cyan} %~%f%F{cyan}${vcs_info_msg_0_}%F{blue}]
└─%F{cyan}%#%f '



# Created by `pipx` on 2025-02-10 05:53:23
export PATH="$PATH:$HOME/.local/bin"
export MANPAGER="batcat -plman"
