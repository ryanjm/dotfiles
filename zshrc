ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ryanjm"
ZSH_CUSTOM=$HOME/code/dotfiles/oh-my-zsh/custom
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates ryanjm)

export PATH="/usr/local/bin:/usr/local/opt/python/libexec/bin:/Users/ryanjm/code/scripts:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

### Postgres from heroku
# export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

### NVM for node management
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi

source /Users/ryanjm/.rvm/scripts/rvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
