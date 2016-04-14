# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Have bash and zsh share same history
HISTFILE=~/.bash_history

# Increase size of history
HISTSIZE=500
SAVEHIST=500

# Have multiple shells append to history
setopt append_history

# Share history among differest shells
# setopt share_history
# setopt inc_append_history

# Type the name of a directory, zsh will change to it
setopt autocd

# Prevent redirection from clobbering existing files
setopt noclobber

# Retrieving previous command inserts pipe to force clobbering
setopt hist_allow_clobber

# Enable zsh auto-complete
autoload -U compinit
compinit

# Enable completing parts of words
setopt magic_equal_subst

# Display lots of matches in an internal pager
zmodload zsh/complist
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Press 'q' to exit from pager
bindkey -M listscroll q send-break

# Display useful informational messages when completing
zstyle ':completion:*' format %d

# Display list of things zsh tried to complete
zstyle ':completion:*:warnings' format 'No matches: %d'

# Have completion system tell us what type of object it is completing
zstyle ':completion:*:descriptions' format %B%d%b

# Group different types of commands completed
zstyle ':completion:*:-command-:*:(commands|builtins|reserved-words|aliases)' \
				group-name commands

# Enable per-match descriptions for completions
zstyle ':completion:*' verbose yes

# Set characters to separate matches from description
zstyle ':completion:*' list-separator '#'

# Specify argement descriptions to completions
zstyle ':completion:*' auto-description 'specify: %d'

# Enable menu-selection
zstyle ':completion*:default' menu 'select=0'

# Bind 'accept' key in menu selection
bindkey -M menuselect '\C-o' accept-and-menu-complete

# Window selection
zstyle ':completion:*:windows' menu on=0

# Enable menu selection in filename expansion
setopt glob_complete

# Bind Tab key to complete-word editor command
bindkey '\C-i' complete-word

# Insert the one match with the all-expansions tag
zstyle ':completion:*:expand:*' tag-order all-expansions 

# Set options for approximate completion
zstyle ':completion:*:approximate:*' max-errors 2
zstyle -e ':completion:*:approximate:*' max-errors \
	    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) )'

# Enable case-insensitive matching
zstyle ':completion:*:(^approximate):*' matcher-list 'm:{a-z}={A-Z}'

# Enable completion in word
setopt complete_in_word

# Set up different types of completions
zstyle ':completion:::::' completer _expand _complete _prefix _correct \
				_approximate _ignored
zstyle ':completion::prefix:::' completer _complete

# Add space automatically when completing
zstyle ':completion:*:prefix:*' add-space true

# Configuring anchors in partial completions
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'm:{a-zA-Z}={A-Za-z}'

# Excluding certain file types in matching
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~'

# Excluding directories of source code control systems
zstyle ':completion:*:*:cd:*' ignored-patterns '(*/|)(CVS|SCCS|.git)'

# Ignoring matches when the same command has two or more arguments
zstyle ':completion::*:(cvs-add|git-add|less|rm|vi|vim):*' ignore-line true

# Ignore directories that make no sense to complete
zstyle ':completion:*' ignore-parents parent pwd

# Enable auto-resuming of jobs
setopt auto_resume

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# User configuration 

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Git completion -- https://github.com/git/git/tree/master/contrib/completion
zstyle ':completion:*:*:git:*' script ~/.oh-my-zsh/custom/git-completion.bash

# Use vi key bindings for command-line editing
bindkey -v

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
