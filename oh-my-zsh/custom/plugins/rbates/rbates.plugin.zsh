c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

export EDITOR='mate -w'

# autocorrect is more annoying than helpful
unsetopt correct_all

# a few aliases I like
alias gs='git status -sb'
alias gd='git diff'
alias tlog='tail -f log/development.log'
alias git-amend='git commit --amend -C HEAD'
alias git-undo='git reset --soft HEAD^'
alias git-count='git shortlog -sn'

# add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"
