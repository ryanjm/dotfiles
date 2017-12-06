ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
ZSH_CUSTOM=$HOME/code/dotfiles/oh-my-zsh/custom
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates ryanjm)

export PATH="/usr/local/bin:/Users/ryanjm/code/scripts:$PATH"
source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Postgres from heroku
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

### NVM for node management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# When changing this file, it needs to be copied to ~/.zshrc (or I'm missing an install step).
