
# Load the Copilot CLI
# if the github-copilot-cli exists
if [[ -x "$(command -v github-copilot-cli)" ]]; then
  eval "$(github-copilot-cli init -- "$0")"
fi

