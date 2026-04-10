
[ -f "/Users/rohan/.ghcup/env" ] && . "/Users/rohan/.ghcup/env" # ghcup-env

alias ls="eza --icons=auto --long --no-user --all --sort=type --smart-group --dereference --git --ignore-glob='.DS_Store'"
alias cd=z

alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias lazy_config='lazygit -g=$HOME/dotfiles/ -w=$HOME'
# --git-dir is where the history lives and --work-tree is where the working tree lives

source <(fzf --zsh)

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Added by Antigravity
export PATH="/Users/rohan/.antigravity/antigravity/bin:$PATH"
