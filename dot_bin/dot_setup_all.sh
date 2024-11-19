# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# ----------------------------------------------------------------------------------------------------------------------

echo "Installing commandline tools..."

xcode-select --install

# ----------------------------------------------------------------------------------------------------------------------

echo "Installing Brew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew analytics off
brew bundle install --global

# ----------------------------------------------------------------------------------------------------------------------

echo "Installing workflows scripts..."
/usr/bin/env zsh -c $HOME/.bin/workflows/install_workflows.zsh

# ----------------------------------------------------------------------------------------------------------------------

/usr/bin/env zsh -c "wezterm_update_icon"
