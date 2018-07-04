# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set TERM to screen-256color for vim editor
# TERM=screen-256color

# Path to your oh-my-zsh installation.
  export ZSH=/home/mm/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Emacs startup alias
alias emacs="emacs -nw --no-splash"

# Vim startup alias
alias gv="gvim -v"

# screenkey auto startup: prevents multiple instances of screenkey
# sc alias configures screenkey to run in upper/right corner of screen
#alias sc="screenkey -s small -p fixed -g 1300x100+2500+25 --opacity 0.6 -t 3"
alias sc="screenkey -s small -p fixed -g 800x100+3000+25 --opacity 0.6 -t 2"
SCREENKEYSERVICE=screenkey
ps ax | grep -v grep | grep $SCREENKEYSERVICE > /dev/null 
if [ "$?" -eq "0" ]; then
		echo "$SCREENKEYSERVICE is running"
elif [ "$?" -eq "1" ]; then
		echo "$SCREENKEYSERVICE starting..."
		sc
else
		echo "$SCREENKEYSERVICE error..."
fi

# alias to change directories in directory stack
alias ddir="dirs -v"

# Exports for local tools
export PATH="/home/mm/Tools/eclipse/java-oxygen/eclipse:/home/mm/Tools/idea-IC-173.4301.25/bin:/home/mm/Tools/gitkraken:$PATH"
export PATH="/home/mm/Tools/grand/grand-ui-0.8.5:$PATH"
export PATH="/home/mm/WorkSpace/nutch-1xx/runtime/local/bin:$PATH"


# Remove duplicate PATH entries (due to TMUX re-reading .zshrc file and duplicating above path appends)
if [ -n "$PATH" ]; then
		old_PATH=$PATH:; PATH=
		while [ -n "$old_PATH" ]; do
				x=${old_PATH%%:*}       # the first remaining entry
				case $PATH: in
						*:"$x":*) ;;         # already there
						*) PATH=$PATH:$x;;    # not there yet
				esac
				old_PATH=${old_PATH#*:}
		done
		PATH=${PATH#:}
		unset old_PATH x
fi

# set JAVA_HOME
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

# less tabstop set
LESS="-x2"
