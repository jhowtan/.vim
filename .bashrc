# bashrc is loaded every time you start an interactive shell
# that is not a login shell.
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

set completion-ignore-case On
set bell-style none

gccr() {
  gcc "$@"
  if [ $? -eq 0 ]; then
    ./a.out
  fi
}

mkcd() {
  mkdir "$1"
  cd "$1"
}

# Configure chruby
source /usr/local/share/chruby/chruby.sh
# Enable chruby auto-switching based on .ruby-version in folder
source /usr/local/share/chruby/auto.sh
