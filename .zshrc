#############################
# Plugins
#############################
if ! [[ -f "${HOME}/.zplug/init.zsh" ]]; then
  curl -sL https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ${HOME}/.zplug/init.zsh

zplug "zplug/zplug"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

if [[ -x /usr/bin/fzf && -f /usr/share/fzf/key-bindings.zsh &&
    -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
else
  if ! [[ -f ~/.fzf.zsh ]] ; then
    if ! [[ -f ~/.fzf/install ]] ; then
      rm -rf ~/.fzf
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    fi
    ~/.fzf/install --all
  fi
  source ~/.fzf.zsh
fi

export FZF_DEFAULT_OPTS="-m --cycle"
if (( $+commands[rg] )) ; then
  export FZF_DEFAULT_COMMAND='rg -l ""'
elif (( $+commands[ag] )); then
  export FZF_DEFAULT_COMMAND='ag -l -g ""'
fi

zplug "b4b4r07/enhancd", use:init.sh

zplug "zsh-users/zsh-completions", use:"*.plugin.zsh"
zplug "so-fancy/diff-so-fancy", as:command, use:diff-so-fancy
zplug "zsh-users/zsh-syntax-highlighting", use:"*.plugin.zsh", defer:3
zplug "zsh-users/zsh-history-substring-search"

export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to PATH
zplug load

bindkey "\eOA" history-substring-search-up
bindkey "\eOB" history-substring-search-down
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

#############################
# Options
#############################
# don't record duplicate history
setopt hist_ignore_dups

# no flow control
setopt noflowcontrol

# rm confirmation
setopt rm_star_wait

# Directory Stack settings
DIRSTACKSIZE=8
setopt auto_cd
setopt autopushd pushdminus pushdsilent pushdtohome pushd_ignore_dups

setopt mark_dirs
setopt multios

# also do completion for aliases
setopt complete_aliases

#############################
# Aliases
#############################
# List direcory contents
if (( $+commands[exa] )) ; then
  alias ls='exa --group-directories-first'
  alias l='ls -F'
  alias ll='ls -glF'
  alias la='ll -a'
  alias lx='ll -s extension'
  alias lk='ll -rs size'
  alias lt='ll -ars modified'
elif (( $+commands[lsd] )) ; then
  alias ls='lsd --icon never --group-dirs first'
  alias l='ls -F'
  alias ll='ls -lF'
  alias la='ll -A'
  #alias lx='ll -s extension'
  alias lk='ll -rS'
  alias lt='ll -rt'
else
  alias ls='ls -h --color --group-directories-first'
  alias l='ls -F'
  alias ll='ls -lF'
  alias la='ll -A'
  alias lx='ls -lXB'
  alias lk='ls -lSr'
  alias lt='ls -lAFtr'
fi
alias sl=ls # often screw this up

# grep
if (( $+commands[rg] )); then
  alias gg='rg'
elif (( $+commands[ag] )); then
  alias gg='ag'
else
  alias gg='grep -R -n'
fi

if (( $+commands[fuck] )); then
  alias fk='fuck'
fi

# Show history
alias history='fc -l 1'

# Tmux 256 default
alias tmux='tmux -2'

# vim alias
if [[ `vim --version 2> /dev/null | grep -- +clientserver` ]] ; then
  # always use vim client server
  alias vim='vim --servername vim'
fi
alias vi='vim'
alias v='vim'
if (( $+commands[nvim] )) ; then
  alias v='nvim'
fi

# Directory Stack alias
alias dirs='dirs -v'
alias ds='dirs'

# use thefuck if available
if (( $+commands[thefuck] )) ; then
  eval $(thefuck --alias)
fi

#############################
# Completions
#############################
# Important
zstyle ':completion:*:default' menu yes=long select=2

# Completing Grouping
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{226}Completing %F{214}%d%f'
zstyle ':completion:*' group-name ''

# Completing misc
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
export LS_COLORS='di=1;34:ln=36:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# default: --
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
