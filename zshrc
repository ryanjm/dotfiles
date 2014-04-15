echo "Start of zshrc"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
ZSH_CUSTOM=$HOME/code/dotfiles/oh-my-zsh/custom
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

echo "before plugins"
plugins=(git bundler brew gem rbates ryanjm)

export PATH="/usr/local/bin:/Users/ryanjm/code/scripts:$PATH"
echo "before oh-my-zsh"
source $ZSH/oh-my-zsh.sh

echo "done with zshrc. starting rbenv"
# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

echo "Postgres"
### Postgres from heroku
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
