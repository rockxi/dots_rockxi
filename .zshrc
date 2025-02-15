# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/bin:/usr/lib64/
export PATH=$PATH:$HOME/.P/intelFPGA_lite/21.1/quartus/bin/
export PATH=$PATH:$HOME/.P/swww/target/release:$HOME/.P/questasim2/questasim/linux_x86_64
export PATH=$PATH:$HOME/.P/questa/questasim/linux_x86_64
export PATH=$PATH:$HOME/.P/questa/questasim/RUVM_2021.2
export PATH=$PATH:$HOME/.P/pycharm/bin

export LM_LICENSE_FILE="/home/r/.P/questa/questasim/license.dat"

export ZSH="$HOME/.oh-my-zsh"
export git="https://github.com"
export mouse_mod="no"
export YDOTOOL_SOCKET=/tmp/.ydotool_socket
#export XAUTHORITY=~/.Xauthority

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh" #"robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker history  zsh-autosuggestions zsh-syntax-highlighting zsh-lsd)
# zsh-autocomplete
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
#   export VISUAL='vim'
# else
  export EDITOR='nvim'
  export VISUAL='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias n=nvim
alias p="python main.py"
alias x="xdg-open"
alias 'v+'="sudo vpn connect"
alias 'v-'="sudo vpn disconnect"
alias typing="$HOME/.P/termboard/main"
alias V="$HOME/.P/nekoray.AppImage"
alias r=ranger
alias ':q'='exit'
alias vial="$HOME/.P/vial.AppImage"
alias lm-studio="$HOME/.P/lm-studio.AppImage"
alias cursor="$HOME/.P/cursor.AppImage"
alias pc="nohup pycharm > /dev/null 2>&1 &"
alias pp="unset HTTP_PROXY && unset HTTPS_PROXY && python main.py"
export DOCKER_HOST=unix:///run/docker.sock


export QSYS_ROOTDIR="/home/r/.P/intelFPGA_lite/21.1/quartus/sopc_builder/bin"
export HTTP_PROXY="http://127.0.0.1:2090"
export HTTPS_PROXY="http://127.0.0.1:2090"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/r/.lmstudio/bin"
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
