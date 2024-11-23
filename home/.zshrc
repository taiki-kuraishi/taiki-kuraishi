#docker aliases
alias do='docker'
alias doc='docker compose'

# haystack-editor
alias hs='haystack-editor'

# sops
export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"

# Taskfile
alias t='task'

# Laravel sail
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# neovim
alias nv='nvim'

# Git
alias g='git'

# global task file
alias tg='task -g'

# ghq
change_repo() {
    local selected_dir
    selected_dir=$(ghq list -p | peco --prompt="repositories >")
    if [ -n "$selected_dir" ]; then
        cd "${selected_dir}" || return
    fi
}
alias cr='change_repo'

exec_commands_history() {
    local selected_command
    selected_command=$(history | peco --query "$LBUFFER")
    if [ -n "$selected_command" ]; then
        eval "$selected_command"
    fi
}
alias h='exec_commands_history'

# gh
eval "$(gh completion -s zsh)"
