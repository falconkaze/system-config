[[ ! -f ~/.zinit/bin/zinit.zsh ]] && git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
source ~/.zinit/bin/zinit.zsh
zinit load skywind3000/z.lua
zinit load zsh-users/zsh-autosuggestions
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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

plugins=(
#  autojump
  git
#  zsh-syntax-highlighting
  transfer
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export MAVEN_OPTS="-Xms4g -Xmx8G"

# zsh autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
[[ -f /usr/local/etc/profile.d/autojump.sh ]] && . /usr/local/etc/profile.d/autojump.sh

[[ -r ~/.func_common.sh ]] && . ~/.func_common.sh
[[ -r ~/.sh_common.sh ]] && . ~/.sh_common.sh
[[ -r ~/.private.zsh ]] && . ~/.private.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------ bind keys --------------------------------
if [[ $(uname) == "Darwin" ]];then
    #bindkey -s '^[k' "^a^kcat <<'EOF'|xargs echo -n|pbcopy\n^y\nEOF\n"
    #bindkey -s '^[k' "^a^kcat <<'EOF'|pbcopy\n^y\nEOF\n"
    #bindkey -s '^[k' "^a^kpbcopy <<'EOF'|tr -d '\\\r\\\n'\n^y\nEOF\n"
    # 注意：这里只支持单行的命令，支持里面带有括号等情况
    bindkey -s '^[k' "^a^kcat <<'EOF'|tr -d '\\\r\\\n'|pbcopy\n^y\nEOF\n"
elif [[ $(uname) == "Linux" ]]; then
    bindkey -s '^[k' "^a^kcat <<'EOF'|xclip -selection c \n^y\nEOF\n"
fi
#source /usr/local/share/antigen/antigen.zsh
#antigen use oh-my-zsh
#antigen apply

# -------------------------- alias config ---------------------------
alias trans="~/bin/trans -e google --shell"
alias reload=". ~/.zshrc"
alias format-json='python3 -c "import sys, json; json_data=json.load(sys.stdin); print(json.dumps(json_data, indent=4, ensure_ascii=False))"'

# -------------------------- export config --------------------------
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export fpath=($HOME/.config/zsh/completions $fpath)
autoload -Uz compinit && compinit -u
autoload -U +X bashcompinit && bashcompinit

# history file config
export SAVEHIST=100000
export HISTSIZE=100000
export HISTORY_IGNORE='([bf]g|cd ..|l[alsh]#( *)#|less *)'
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

alias j='z'

# =================================加速粘贴速度=================================
# see [zsh 粘贴加速，解决粘贴卡慢问题 - 简书](https://www.jianshu.com/p/83d9b8e245ae)
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
