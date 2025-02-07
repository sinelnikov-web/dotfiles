integrations=(
	brew
	git
	cmd
	shell
	dependencies
)

source "$ZSH/plugins/zsh-defer/zsh-defer.plugin.zsh"

for name in $integrations; do
	source "$ZSH/integrations/$name.zsh"
done
