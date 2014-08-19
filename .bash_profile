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
