# Read by every zsh, interactive or not, so scripts and agents see these too.

# glab, jira-cli and confluence-cli keep their logins in ~/.devcontainer-logins, the folder the
# dev containers mount too: one login for this machine and every container, no Keychain.
export GLAB_CONFIG_DIR="$HOME/.devcontainer-logins/glab"
export JIRA_CONFIG_FILE="$HOME/.devcontainer-logins/jira/.config.yml"
export CONFLUENCE_CONFIG_DIR="$HOME/.devcontainer-logins/confluence-cli"
export NETRC="$HOME/.devcontainer-logins/netrc"
export CONFLUENCE_KEYCHAIN=off
