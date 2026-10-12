set fish_greeting ""

# Aliases

alias grep "grep --color=auto"
alias cat "bat"
alias catn "bat --style=plain"
alias catnp "bat --style=plain --paging=never"
alias tree "lsd --tree"
alias ls "lsd --group-dirs=first"
alias cls "clear"
alias settarget "set_target"
alias cleartarget "clear_target"
alias nc "ncat"
alias cme "netexec"
alias crackmapexec "netexec"

# Prompt

set -g tide_left_prompt_items os pwd cmd_duration context status

set -g tide_right_prompt_items private_mode git docker

#screenfetch -c 4,7 -E
# Functions

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

function set_target
    set ip_address $argv[1]
    set machine_name $argv[2]
    echo "$ip_address $machine_name" > /home/RafaxWolf/.config/qtile/scripts/target
end

function clear_target
    echo '' > /home/RafaxWolf/.config/qtile/scripts/target
end
