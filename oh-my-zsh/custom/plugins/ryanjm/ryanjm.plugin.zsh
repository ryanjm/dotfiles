echo "Loading ryanjm plugin"

alias cls='clear; ls'
alias clsa='clear; lsa'

# https://gist.github.com/piscisaureus/3342247
function pullify() {
  git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
}
