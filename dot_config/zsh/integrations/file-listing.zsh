## -- EZA --------------------------------------------------------------------------------------------------------------

COLORS="$($(which vivid) generate catppuccin-$CATPPUCCIN_FLAVOR)"

export LS_COLORS=COLORS
export EZA_COLORS=COLORS

eza_params=('--git' '--icons' '--group' '--group-directories-first' '--time-style=long-iso')

alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lt='eza --tree $eza_params'
