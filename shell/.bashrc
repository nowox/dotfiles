# ~/.bashrc
# Author: Yves Chevallier <nowox@x0x.ch>
# Date:   2015-04-05 Sun 11:35 PM 

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

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
shopt -s extglob
shopt -s histappend              # Append history instead of overwriting file
shopt -s checkwinsize            # Check window size after each command
shopt -s no_empty_cmd_completion # No empty completion

# Misc Exports
export PAGER=less
export VIMRUNTIME='/usr/share/vim/vim74'
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

# Prompt
p="${rst}$( title '\W' )" # Title: basename
p="${p}${c[0]}\u@"      # User
p="${p}${c[1]}\h "      # Host
p="${p}${c[2]}\w"       # Path
p="${p}${rst}\n$( [[ $UID == 0 ]] && echo \# || echo \$ ) "
export PS1="${p}"

# Aliases
alias browse='explorer $(cygpath --windows $(pwd))'

alias df='df -h'
alias du='du'

alias less='less -r'                          # raw control characters
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

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
alias ag='ag --color-match="31;40" -U -S --ignore *.xml --ignore *.html'
alias ags='ag --color-match="31;40" -U -S -G "[.](c|h|inc|def|txt|ldf|asm)$"'
alias agd='ag --color-match="31;40" -U -S -G "[.](def)$"'

# At work
alias etreg='etreg.bat'
alias etver='etver.bat'
alias ct="cleartool"


# Functions
setenv () {
    PWD=`pwd -P`/scripts
    if [ -d "$PWD" ] && [[ ":$PATH:" != *":$PWD:"* ]]; then
        PATH="${PATH:+"$PATH:"}$PWD"
    fi
}

colorscheme () {
    if [ "$1" = "0" ]; then
        #base16
        echo -ne    '\e]10;#d0d0d0\a' # ForegroundColour
        echo -ne    '\e]11;#151515\a' # BackgroundColour
        echo -ne    '\e]12;#FD9D4F\a' # CursorColour
        echo -ne '\e]4;262;#FD9D4F\a' # IMECursorColour
        echo -ne   '\e]4;0;#151515\a' # Black
        echo -ne   '\e]4;8;#0a0a0a\a' # BoldBlack
        echo -ne   '\e]4;1;#AC4142\a' # Red
        echo -ne   '\e]4;9;#C25E5E\a' # BoldRed
        echo -ne   '\e]4;2;#90A959\a' # Green
        echo -ne  '\e]4;10;#A6BB7B\a' # BoldGreen
        echo -ne   '\e]4;3;#F4BF75\a' # Yellow
        echo -ne  '\e]4;11;#F8D5A5\a' # BoldYellow
        echo -ne   '\e]4;4;#6A9FB5\a' # Blue
        echo -ne  '\e]4;12;#8CB5C6\a' # BoldBlue
        echo -ne   '\e]4;5;#AA759F\a' # Magenta
        echo -ne  '\e]4;13;#BE95B5\a' # BoldMagenta
        echo -ne   '\e]4;6;#75B5AA\a' # Cyan
        echo -ne  '\e]4;14;#97C7BE\a' # BoldCyan
        echo -ne   '\e]4;7;#D0D0D0\a' # White
        echo -ne  '\e]4;15;#F5F5F5\a' # BoldWhite

        # Cursor color for gnome-terminal
        if [ "$TERM" = "xterm" ]; then
            echo -ne '\e]12;#ffcc00\a'
        fi
    fi

    if [ "$1" = "1" ]; then
        # solarized light
        echo -ne '\e]4;0;#073642\a'   # black
        echo -ne '\e]4;1;#dc322f\a'   # red
        echo -ne '\e]4;2;#859900\a'   # green
        echo -ne '\e]4;3;#b58900\a'   # yellow
        echo -ne '\e]4;4;#268bd2\a'   # blue
        echo -ne '\e]4;5;#d33682\a'   # magenta
        echo -ne '\e]4;6;#2aa198\a'   # cyan
        echo -ne '\e]4;7;#eee8d5\a'   # white (light grey really)
        echo -ne '\e]4;8;#002b36\a'   # bold black (i.e. dark grey)
        echo -ne '\e]4;9;#cb4b16\a'   # bold red
        echo -ne '\e]4;10;#586e75\a'  # bold green
        echo -ne '\e]4;11;#657b83\a'  # bold yellow
        echo -ne '\e]4;12;#839496\a'  # bold blue
        echo -ne '\e]4;13;#6c71c4\a'  # bold magenta
        echo -ne '\e]4;14;#93a1a1\a'  # bold cyan
        echo -ne '\e]4;15;#fdf6e3\a'  # bold white

        echo -ne '\e]10;#586e75\a'  # foreground
        echo -ne '\e]11;#fdf6e3\a'  # background
        echo -ne '\e]12;#eee8d5\a'  # cursor
    fi

    if [ "$1" = "2" ]; then
        # solarized dark
        echo -ne '\e]4;0;#073642\a'   # black
        echo -ne '\e]4;1;#dc322f\a'   # red
        echo -ne '\e]4;2;#859900\a'   # green
        echo -ne '\e]4;3;#b58900\a'   # yellow
        echo -ne '\e]4;4;#268bd2\a'   # blue
        echo -ne '\e]4;5;#d33682\a'   # magenta
        echo -ne '\e]4;6;#2aa198\a'   # cyan
        echo -ne '\e]4;7;#eee8d5\a'   # white (light grey really)
        echo -ne '\e]4;8;#002b36\a'   # bold black (i.e. dark grey)
        echo -ne '\e]4;9;#cb4b16\a'   # bold red
        echo -ne '\e]4;10;#586e75\a'  # bold green
        echo -ne '\e]4;11;#657b83\a'  # bold yellow
        echo -ne '\e]4;12;#839496\a'  # bold blue
        echo -ne '\e]4;13;#6c71c4\a'  # bold magenta
        echo -ne '\e]4;14;#93a1a1\a'  # bold cyan
        echo -ne '\e]4;15;#fdf6e3\a'  # bold white

        echo -ne '\e]10;#eee8d5\a'  # foreground
        echo -ne '\e]11;#002b36\a'  # background
        echo -ne '\e]12;#859900\a'  # cursor
    fi

    if [ "$1" = "3" ]; then
        # xoria
        echo -ne    '\e]10;#d0d0d0\a' # ForegroundColour
        echo -ne    '\e]11;#1c1c1c\a' # BackgroundColour
        echo -ne    '\e]12;#ffaf00\a' # CursorColour
        echo -ne '\e]4;262;#80e0a0\a' # IMECursorColour
        echo -ne   '\e]4;0;#0c0c0c\a' # Black
        echo -ne   '\e]4;8;#0a0a0a\a' # BoldBlack
        echo -ne   '\e]4;1;#d78787\a' # Red
        echo -ne   '\e]4;9;#df8787\a' # BoldRed
        echo -ne   '\e]4;2;#afd787\a' # Green
        echo -ne  '\e]4;10;#afdf87\a' # BoldGreen
        echo -ne   '\e]4;3;#f7f7af\a' # Yellow
        echo -ne  '\e]4;11;#ffffaf\a' # BoldYellow
        echo -ne   '\e]4;4;#87afd7\a' # Blue
        echo -ne  '\e]4;12;#87afdf\a' # BoldBlue
        echo -ne   '\e]4;5;#d7afd7\a' # Magenta
        echo -ne  '\e]4;13;#dfafdf\a' # BoldMagenta
        echo -ne   '\e]4;6;#afd7d7\a' # Cyan
        echo -ne  '\e]4;14;#afdfdf\a' # BoldCyan
        echo -ne   '\e]4;7;#e6e6e6\a' # White
        echo -ne  '\e]4;15;#eeeeee\a' # BoldWhite
    fi

    if [ "$1" = "4" ]; then
        # present
        echo -ne    '\e]10;#000000\a' # ForegroundColour
        echo -ne    '\e]11;#FFFFFF\a' # BackgroundColour
        echo -ne    '\e]12;#98FB98 \a' # CursorColour
        echo -ne '\e]4;262;#98FB98 \a' # IMECursorColour
        echo -ne   '\e]4;0;#000000\a' # Black
        echo -ne   '\e]4;8;#2F4F4F\a' # BoldBlack
        echo -ne   '\e]4;1;#800000\a' # Red
        echo -ne   '\e]4;9;#8B4513\a' # BoldRed
        echo -ne   '\e]4;2;#556B2F\a' # Green
        echo -ne  '\e]4;10;#808000\a' # BoldGreen
        echo -ne   '\e]4;3;#DAA520\a' # Yellow
        echo -ne  '\e]4;11;#FFD700\a' # BoldYellow
        echo -ne   '\e]4;4;#4682B4\a' # Blue
        echo -ne  '\e]4;12;#5F9EA0\a' # BoldBlue
        echo -ne   '\e]4;5;#C71585\a' # Magenta
        echo -ne  '\e]4;13;#F08080\a' # BoldMagenta
        echo -ne   '\e]4;6;#008080\a' # Cyan
        echo -ne  '\e]4;14;#66CDAA\a' # BoldCyan
        echo -ne   '\e]4;7;#FFFFFF\a' # White
        echo -ne  '\e]4;15;#FFEBCD\a' # BoldWhite
    fi
}

colorscheme 0

alias dark="colorscheme 0"
alias light="colorscheme 4"
