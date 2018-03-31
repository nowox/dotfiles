# ~/.bashrc
# Author: Yves Chevallier <nowox@x0x.ch>
# Date:   2015-04-05 Sun 11:35 PM

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

# Mintty
bind -r '\C-s'
stty -ixon

# Xorg
export DISPLAY=:0.0

# Prompt
short_pwd() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=40

    # Indicate that there has been dir truncation
    local trunc_symbol=".."

    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        echo ${trunc_symbol}/${NEW_PWD#*/}
    fi
}

title () {
    echo -ne "\e]0;$1\a"
}

# Title Window
ts='\033]0;'  # Start
te='\007'     # End

r0='\e[0;30m' # Black - Regular
r2='\e[0;31m' # Red
r5='\e[0;32m' # Green
r4='\e[0;33m' # Yellow
r6='\e[0;34m' # Blue
r7='\e[0;35m' # Purple
r8='\e[0;36m' # Cyan
r9='\e[0;37m' # White

b0='\e[1;30m' # Black - Bold
b2='\e[1;31m' # Red
b5='\e[1;32m' # Green
b4='\e[1;33m' # Yellow
b6='\e[1;34m' # Blue
b7='\e[1;35m' # Purple
b8='\e[1;36m' # Cyan
b9='\e[1;37m' # White

# Underline  [4;30m
# Background [40m
#
rst='\e[0m'   # Text reset color

# Prompt Colors
c=($r6 $b6 $r8)
[[ $_iscygwin -eq 1 ]] && c=($r5 $b5 $r4)
[[ $_isroot   -eq 1 ]] && c=($r2 $b2 $r7)

perl -e 'exit(qx{uname -a} =~ /x86_64/)'
if [ $? -ne 0 ]
then
    c=($r6 $b6 $r8)
fi
# Prompt

p="${rst}$( title '\W' )" # Title: basename
p="${p}${c[0]}\u@"      # User
p="${p}${c[1]}\h (\j) "      # Host
p="${p}${c[2]}\w"       # Path
p="${p}${rst}\n$( [[ $UID == 0 ]] && echo \# || echo \$ ) "
export PS1="${p}"

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

mintheme dark
