ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ryanjm"
ZSH_CUSTOM=$HOME/code/dotfiles/oh-my-zsh/custom
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem ryanjm)

export PATH="/usr/local/bin:/usr/local/opt/python/libexec/bin:/Users/ryanjm/code/scripts:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
source $ZSH/oh-my-zsh.sh

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

# if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

eval "$(zoxide init zsh --cmd cd)"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ryanjm/.lmstudio/bin"
# End of LM Studio CLI section


[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Added by Antigravity
export PATH="/Users/ryanjm/.antigravity/antigravity/bin:$PATH"


# PAI Configuration (added by Kai Bundle installer)
export DA="Kai"
export TIME_ZONE="America/Los_Angeles"
export PAI_SOURCE_APP="$DA"


export PATH="$HOME/.local/bin:$PATH"
