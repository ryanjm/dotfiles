# Ryan Mathews Dot Files

## Installation

Install [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh):

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


```terminal
cd ~/code
git clone git://github.com/ryanjm/dotfiles
cd dotfiles
ln -s ~/code/dotfiles/zshrc ~/.zshrc
ln -s ~/code/dotfiles/vimrc ~/.vimrc
ln -s ~/code/dotfiles/gitignore ~/.gitignore
ln -s ~/code/dotfiles/gemrc ~/.gemrc
cp ~/code/dotfiles/gitconfig.erb ~/.gitconfig
```

Right now, this doesn't handle filling out the gitconfig file. You have to do that manually. Maybe some day I'll update the rake file for just that file.


## Features

Like Ryan Bates, I normally place all of my coding projects in ~/code, so this directory can easily be accessed (and tab completed) with the "c" command.

```terminal
c railsca<tab>
```

There is also an "h" command which behaves similar, but acts on the home path.

```terminal
h doc<tab>
```

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.zshrc # careful here
rm ~/.gitconfig
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.


# Installing vim pathogen plugins

```
$ git submodule add git://.... vim/bundle/[name of plugin]
```
