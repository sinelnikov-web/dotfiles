eval "$(/opt/homebrew/bin/brew shellenv)"

## ---------------------------------------------------------------------------------------------------------------------

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-bash
if type brew &>/dev/null; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

	autoload -Uz compinit
	compinit
fi

## ---------------------------------------------------------------------------------------------------------------------

# https://github.com/git-quick-stats/git-quick-stats#macos-homebrew
export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"

source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
