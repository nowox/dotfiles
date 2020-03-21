# ~/.bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Conditionals
_iscygwin=0
[[ $( uname -s ) == *"CYGWIN"* ]] && _iscygwin=1

_isroot=0
[[ $UID -eq 0 ]] && _isroot=1

_color=0
[[ "$TERM" =~ xterm_color ]] && _color=1

# Umask
umask 022

# History
export HOSTCONTROL=ignoredups:ignorespace
export HISTSIZE=9999
export HISTFILESIZE=9999

# Shelloptions (shopt)
shopt -s cdspell                 # Autocorrect mistyped directory
shopt -s autocd                  # Automatically add cd before known dir names
shopt -s dirspell
shopt -s globstar
shopt -s progcomp
shopt -s extglob
shopt -s histappend              # Append history instead of overwriting file
shopt -s checkwinsize            # Check window size after each command
shopt -s no_empty_cmd_completion # No empty completion
shopt -s cmdhist
shopt -s histappend histreedit histverify

# Misc Exports
export HOSTCONTROL=ignoredups:ignorespace
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
export PAGER=less
export EDITOR=vim
export PATH="~/bin:~/.scripts:$PATH"
export TIME_STYLE=long-iso

# Mintty
bind -r '\C-s'
stty -ixon

# Xorg/X
export DISPLAY=:0.0

# Prompt
source ~/.bash_prompt

# Aliases
alias browse='explorer $(cygpath --windows $(pwd))'

# Standard tools
alias du='du -c -h'
alias df='df -h'
alias less='less -r'                          # raw control characters
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias diff='colordiff'

alias ls='ls -h --color=auto --hide="*.pyc"'
alias lx='ls -lXB'    # Sort by extensions.
alias lk='ls -lSr'    # Sort by size, biggest last.
alias lt='ls -ltr'    # Sort by date, most recent last.
alias lc='ls -ltcr'   # Sort by/show change time, most recent last.
alias lu='ls -ltur'   # Sort by/show access time, most recent last.
alias ll='ls -lv --group-directories-first'
alias lr='ll -R'
alias la='ll -a'

alias svim='sudo vim'
alias root='sudo su'

alias vi='vim'
alias tmux="tmux -u"
alias ..='cd ..'

# Search tool
alias ags='ag --color-match="31;40" -U -S -G "[.](c|h|inc|def|txt|ldf|asm)$"'
alias agd='ag --color-match="31;40" -U -S -G "[.](def)$"'

# At work
alias ct="cleartool"

# Very quick
alias a='ag --color-match="31;40" -U -S'
alias g="git g"
alias l="ls -h --color=auto"
alias p="ipython --profile=etel"
alias t="task"
alias v="vim"

alias chrome="'/cygdrive/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'"
alias todo="vim ~/.notes/todo.md"
alias note="vim ~/.notes/notes.md"

# WSL
alias e='explorer.exe .'

# Easily extract any kind of atchives.
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar2dir $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

bcomp() {
    a="$1"
    b="$2"

    aw="$(cygpath -w $a)"
    bw="$(cygpath -w $b)"

    "/cygdrive/c/Program Files (x86)/Beyond Compare 4/Bcomp.exe" $aw $bw /lefttitle=$a /righttitle=$b
}


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
