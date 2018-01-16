# Path to your oh-my-zsh installation.
export ZSH=/Users/davidvezzani/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(rails git ruby brew chucknorris)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.bash-path

export PATH="$PATH:/Users/davidvezzani/bin"
export PATH="$PATH:/Users/davidvezzani/.npm-packages/lib/node_modules/livedown/bin"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias findr="find . -name \"*.rb\"|xargs grep -rn \"OrderFulfillmentUploader\" | awk -F: '{print \$1\":\"\$2}'"
#unalias findr

source ~/scripts/findr_filtr.sh

# chuck_cow

alias replace='~/scripts/replace.sh'

export HOME_DIR=/Users/davidvezzani

# function setjdk() {
#   if [ $# -ne 0 ]; then
#    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
#    if [ -n "${JAVA_HOME+x}" ]; then
#     removeFromPath $JAVA_HOME
#    fi
#    export JAVA_HOME=`/usr/libexec/java_home -v $@`
#    export PATH=$JAVA_HOME/bin:$PATH
#   fi
#  }
#  function removeFromPath() {
#   export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
#  }
# setjdk 1.7
#

#I assume you have installed all different versions - or else delete some
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_7_HOME=$(/usr/libexec/java_home -v1.7)
# export JAVA_6_HOME=$(/usr/libexec/java_home -v1.6)
 
# alias java6='export JAVA_HOME=$JAVA_6_HOME'
alias java7='export JAVA_HOME=$JAVA_7_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'
 
#default java7
export JAVA_HOME=$JAVA_8_HOME

alias journal='cd ~/Dropbox/journal/current/'
alias ojournal='open ~/Dropbox/journal/current/'

alias wiki='cd ~/reliacode/crystal_commerce/core.wiki/'
alias owiki='open https://github.com/crystalcommerce/core/wiki'

alias down='cd ~/Downloads/'
alias odown='open ~/Downloads/'

alias opt='open https://www.pivotaltracker.com/n/projects/1884983'

alias opulls='ccapp=$(echo $(pwd) | sed '"'"'s;.*reliacode/crystal_commerce/\([^/ ]*\).*;\1;g'"'"'); echo "$ccapp"; open https://github.com/crystalcommerce/"$ccapp"/pulls'
alias oloc='ccapp=$(echo $(pwd) | sed '"'"'s;.*reliacode/crystal_commerce/\([^/ ]*\).*;\1;g'"'"'); echo "$ccapp"; ~/scripts/open_local_rails_app.sh "$ccapp"'
alias oapp='ccapp=$(echo $(pwd) | sed '"'"'s;.*reliacode/crystal_commerce/\([^/ ]*\).*;\1;g'"'"'); echo "$ccapp"; ~/scripts/open_rails_app.sh "$ccapp"'
alias cdcc='cd ~/reliacode/crystal_commerce; cd '
alias occ='cd ~/reliacode/crystal_commerce; open '
alias owikis='ccapp=$(echo $(pwd) | sed '"'"'s;.*reliacode/crystal_commerce/\([^/ ]*\).*;\1;g'"'"'); echo "$ccapp"; open https://github.com/crystalcommerce/"$ccapp"/wiki'
# alias obuf='mvim /Users/davidvezzani/Dropbox/journal/current/fbuf-$(date +%Y%m%d).md'
alias obuf='~/scripts/obuf.sh'

alias notify='scripts/notify'

alias textwc='mvim /Users/davidvezzani/Dropbox/journal/11-nov-2016/20161027-sending-text-messages-to-ward-council-members.md'

alias neatscan='open -a Terminal /Library/Image\ Capture/Devices/NeatScannersICDriver.app/Contents/MacOS/NeatScannersICDriver'

export TTX_DIR=/Users/davidvezzani/Library/Python/2.7/bin
export PATH=$PATH:$TTX_DIR

alias wl='~/scripts/work-latest.sh'
alias wl-cache='cat ~/.wl-cache'
alias open-sc="open $(defaults read com.apple.screencapture location)"
alias gitimg="open https://github.com/crystalcommerce/core/issues/new"
alias pgitimg="open https://github.com/dcvezzani/dcv_journal/issues/new"

alias ghc-switch='/Users/davidvezzani/scripts/ghc-switch'
export PATH=/usr/local/stow:$PATH


source /Users/davidvezzani/.bash_profile

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
