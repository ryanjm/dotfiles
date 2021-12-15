c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# a few aliases I like
alias gs='git status -sb'
alias gd='git diff'
alias cls='clear; ls'
alias clsa='clear; lsa'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
alias sshryanjm='ssh root@174.138.67.30'

# https://gist.github.com/piscisaureus/3342247
function pullify() {
  git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
}

# set -o vi
alias echopath="tr ':' '\n' <<< \"$PATH\""

# For Django
alias pm="python manage.py"




# add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"