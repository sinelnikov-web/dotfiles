export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"

## ---------------------------------------------------------------------------------------------------------------------

export ZSH="$XDG_CONFIG_HOME/zsh"

## ---------------------------------------------------------------------------------------------------------------------

export BIN_PATH="$HOME/.bin"
export PATH="$BIN_PATH:$PATH"

## ---------------------------------------------------------------------------------------------------------------------

export MACOS_IS_DARK=$([[ $(defaults read -g AppleInterfaceStyle 2>&1) == "Dark" ]] && echo "yes" || echo "no")
export CATPPUCCIN_FLAVOR=$([[ $MACOS_IS_DARK == "yes" ]] && echo "frappe" || echo "latte")
