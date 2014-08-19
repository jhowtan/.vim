# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
autoload -U zutil
autoload -U compinit
autoload -U complist
compinit

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"
#ZSH_THEME="random"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git ruby cp ruby brew zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER="jon"
export PATH=$HOME/bin:$PATH

# Aliases and shortcuts
alias chrome='open -a Google\ Chrome.app'
alias z='source ~/.zshrc && echo ".zshrc reloaded!"'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias dnsclear="sudo killall -HUP mDNSResponder"
#alias vi='/usr/local/bin/vim'

# Zsh hacks for an easier life
set -o vi # Vi like navigation on Zsh
setopt autocd

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

#############
# Ruby shit #
#############

# Configure chruby
source /usr/local/share/chruby/chruby.sh
# Enable chruby auto-switching based on .ruby-version in folder
source /usr/local/share/chruby/auto.sh
# Set the default ruby via chruby
chruby ruby-2.1.2

# export MANPATH="/usr/local/man:$MANPATH"

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
