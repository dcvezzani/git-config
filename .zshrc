source $HOME/.bashrc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
plugins=(git brew)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# source ~/.bashrc
source ~/.bash-path

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.npm-packages/lib/node_modules/livedown/bin"

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

export HOME_DIR=$HOME

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
export JAVA_12_HOME=$(/usr/libexec/java_home -v12)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
# export JAVA_7_HOME=$(/usr/libexec/java_home -v1.7)
# export JAVA_6_HOME=$(/usr/libexec/java_home -v1.6)

#default java7
export JAVA_HOME=$JAVA_8_HOME
 
export TTX_DIR=$HOME/Library/Python/2.7/bin
export PATH=$PATH:$TTX_DIR

export PATH=/usr/local/stow:$PATH

source $HOME/.bash_profile
source $HOME/.bash-aliases
source $HOME/.vim/.bash-aliases

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NODE_MODULES_BIN="$HOME/scripts/node_modules/.bin"
export PATH="$PATH:$NODE_MODULES_BIN"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/dcvezzani/personal-projects/aws/serverless-nodejs-template/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/dcvezzani/personal-projects/aws/serverless-nodejs-template/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/dcvezzani/personal-projects/aws/serverless-nodejs-template/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/dcvezzani/personal-projects/aws/serverless-nodejs-template/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/dcvezzani/personal-projects/aws/serverless-nodejs-template/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/dcvezzani/personal-projects/aws/serverless-nodejs-template/node_modules/tabtab/.completions/slss.zsh
###-tns-completion-start-###
if [ -f /Users/dcvezzani/.tnsrc ]; then 
    source /Users/dcvezzani/.tnsrc 
fi
###-tns-completion-end-###

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dcvezzani/.sdkman"
[[ -s "/Users/dcvezzani/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dcvezzani/.sdkman/bin/sdkman-init.sh"
# export PATH="/usr/local/opt/terraform@0.13/bin:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

