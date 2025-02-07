# nvm
export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# bun completions
[ -s "/Users/sinelnikovweb/.bun/_bun" ] && source "/Users/sinelnikovweb/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ghcup
[ -f "/Users/sinelnikovweb/.ghcup/env" ] && . "/Users/sinelnikovweb/.ghcup/env" # ghcup-env

# postgresql
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Created by `pipx` on 2024-01-05 07:28:25
export PATH="$PATH:/Users/sinelnikovweb/.local/bin"
. "$HOME/.cargo/env"

# node
export NODE_OPTIONS="--max-old-space-size=4096"
