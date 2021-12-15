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