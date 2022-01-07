bindkey -e
PROMPT='%F{green}%~$ %F{wrhite}'

export XDG_CONFIG_HOME=$HOME/.config
export PATH="$HOME/dotfiles/bin:$HOME/local/bin:$PATH"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

RPROMPT=$'$(vcs_info_wrapper)'

# History setting
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=100000
setopt sharehistory
setopt extendedhistory

# Alias
alias pushr="git push origin"
alias pullr="git pull origin"

# ls and completion color setting
autoload -U compinit
compinit
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# end

case ${OSTYPE} in
    darwin*)
        export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    	alias ls='ls -G'
        ;;
    linux*)
        # xinput --set-prop "Logitech MX Ergo" "Device Accel Constant Deceleration" 1.8
    	alias ls='ls --color=auto'
        ;;
esac

source $HOME/.local.zsh
