# Author: Yves Chevallier <nowox@x0x.ch>
# Desc: My bashrc

##########
# Basics #
##########

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Umask
umask 027
export VIMRUNTIME=`cygpath $VIMRUNTIME`
export PYTHONHOME='/usr/local/bin'
export PYTHONPATH='/usr/local/lib/python2.7/'
# Mintty {{{
# Mintty <C-S> for vim
bind -r '\C-s'
stty -ixon
# }}}
# Colors definition {{{

# Reset
nocolor="\[\033[0m\]"         # Text Reset

# Regular Colors
black="\[\033[0;30m\]"        # Black
red="\[\033[0;31m\]"          # Red
green="\[\033[0;32m\]"        # Green
yellow="\[\033[0;33m\]"       # Yellow
blue="\[\033[0;34m\]"         # Blue
purple="\[\033[0;35m\]"       # Purple
cyan="\[\033[0;36m\]"         # Cyan
white="\[\033[0;37m\]"        # White

# Bold
bblack="\[\033[1;30m\]"       # Black
bred="\[\033[1;31m\]"         # Red
bgreen="\[\033[1;32m\]"       # Green
byellow="\[\033[1;33m\]"      # Yellow
bblue="\[\033[1;34m\]"        # Blue
bpurple="\[\033[1;35m\]"      # Purple
bcyan="\[\033[1;36m\]"        # Cyan
bwhite="\[\033[1;37m\]"       # White

# Underline
ublack="\[\033[4;30m\]"       # Black
ured="\[\033[4;31m\]"         # Red
ugreen="\[\033[4;32m\]"       # Green
uyellow="\[\033[4;33m\]"      # Yellow
ublue="\[\033[4;34m\]"        # Blue
upurple="\[\033[4;35m\]"      # Purple
ucyan="\[\033[4;36m\]"        # Cyan
uwhite="\[\033[4;37m\]"       # White

# Background
on_black="\[\033[40m\]"       # Black
on_red="\[\033[41m\]"         # Red
on_green="\[\033[42m\]"       # Green
on_yellow="\[\033[43m\]"      # Yellow
on_blue="\[\033[44m\]"        # Blue
on_purple="\[\033[45m\]"      # Purple
on_cyan="\[\033[46m\]"        # Cyan
on_white="\[\033[47m\]"       # White

# High Intensty
iblack="\[\033[0;90m\]"       # Black
ired="\[\033[0;91m\]"         # Red
igreen="\[\033[0;92m\]"       # Green
iyellow="\[\033[0;93m\]"      # Yellow
iblue="\[\033[0;94m\]"        # Blue
ipurple="\[\033[0;95m\]"      # Purple
icyan="\[\033[0;96m\]"        # Cyan
iwhite="\[\033[0;97m\]"       # White

# Bold High Intensty
biblack="\[\033[1;90m\]"      # Black
bired="\[\033[1;91m\]"        # Red
bigreen="\[\033[1;92m\]"      # Green
biyellow="\[\033[1;93m\]"     # Yellow
biblue="\[\033[1;94m\]"       # Blue
bipurple="\[\033[1;95m\]"     # Purple
bicyan="\[\033[1;96m\]"       # Cyan
biwhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
on_iblack="\[\033[0;100m\]"   # Black
on_ired="\[\033[0;101m\]"     # Red
on_igreen="\[\033[0;102m\]"   # Green
on_iyellow="\[\033[0;103m\]"  # Yellow
on_iblue="\[\033[0;104m\]"    # Blue
on_ipurple="\[\033[10;95m\]"  # Purple
on_icyan="\[\033[0;106m\]"    # Cyan
on_iwhite="\[\033[0;107m\]"   # White

# }}}
# Git Prompt {{{

export GIT_PS1_SHOWDIRTYSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=false

# Scavenged from Git 1.6.5.x contrib/completion/git_completion.bash
# __git_ps1 accepts 0 or 1 arguments (i.e., format string)
# returns text to add to bash PS1 prompt (includes branch name)
__gitdir ()
{
  if [ -z "${1-}" ]; then
    if [ -n "${__git_dir-}" ]; then
      echo "$__git_dir"
    elif [ -d .git ]; then
      echo .git
    else
      git rev-parse --git-dir 2>/dev/null
    fi
  elif [ -d "$1/.git" ]; then
    echo "$1/.git"
  else
    echo "$1"
  fi
}
__git_ps1 ()
{
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local r
    local b
    if [ -f "$g/rebase-merge/interactive" ]; then
      r="|REBASE-i"
      b="$(cat "$g/rebase-merge/head-name")"
    elif [ -d "$g/rebase-merge" ]; then
      r="|REBASE-m"
      b="$(cat "$g/rebase-merge/head-name")"
    else
      if [ -d "$g/rebase-apply" ]; then
        if [ -f "$g/rebase-apply/rebasing" ]; then
          r="|REBASE"
        elif [ -f "$g/rebase-apply/applying" ]; then
          r="|AM"
        else
          r="|AM/REBASE"
        fi
      elif [ -f "$g/MERGE_HEAD" ]; then
        r="|MERGING"
      elif [ -f "$g/BISECT_LOG" ]; then
        r="|BISECTING"
      fi

      b="$(git symbolic-ref HEAD 2>/dev/null)" || {

        b="$(
        case "${GIT_PS1_DESCRIBE_STYLE-}" in
        (contains)
          git describe --contains HEAD ;;
        (branch)
          git describe --contains --all HEAD ;;
        (describe)
          git describe HEAD ;;
        (* | default)
          git describe --exact-match HEAD ;;
        esac 2>/dev/null)" ||

        b="$(cut -c1-7 "$g/HEAD" 2>/dev/null)..." ||
        b="unknown"
        b="($b)"
      }
    fi

    local w
    local i
    local s
    local u
    local c

    if [ "true" = "$(git rev-parse --is-inside-git-dir 2>/dev/null)" ]; then
      if [ "true" = "$(git rev-parse --is-bare-repository 2>/dev/null)" ]; then
        c="BARE:"
      else
        b="GIT_DIR!"
      fi
    elif [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
      if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ]; then
        if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
          git diff --no-ext-diff --ignore-submodules \
            --quiet --exit-code || w="*"
          if git rev-parse --quiet --verify HEAD >/dev/null; then
            git diff-index --cached --quiet \
              --ignore-submodules HEAD -- || i="+"
          else
            i="#"
          fi
        fi
      fi
      if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ]; then
              git rev-parse --verify refs/stash >/dev/null 2>&1 && s="$"
      fi

      if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ]; then
         if [ -n "$(git ls-files --others --exclude-standard)" ]; then
            u="%"
         fi
      fi
    fi

    if [ -n "${1-}" ]; then
      printf "$1" "$c${b##refs/heads/}$w$i$s$u$r"
    else
      printf " (%s)" "$c${b##refs/heads/}$w$i$s$u$r"
    fi
  fi
}
# }}}
# Prompt {{{

time24="\A"
path_short="\w"
path_full="\W"
jobs_="\j"
hostname="\h"
username="\u"
title="\033]2;\W\007"

ps1_time="$igreen[\A]$nocolor"

if [[ ${USER} == "root" ]]; then
    ps1_0="$red$username@$ired$hostname$nocolor"
else
    if [[ ${HOSTNAME} == "canard" ]]; then
        ps1_0="$blue$username$igreen@$hostname$nocolor"
    else
        ps1_0="$green$username$igreen@$hostname$nocolor"
    fi
fi
ps1_9=" $yellow$path_short$nocolor\n$ "
ps1_git='$(\
    [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; \
    if [ $? -eq 0 ]; then \
        if [[ `git status --porcelain 2>&1` =~ ^\ M ]]; then \
            # Changes to working tree (something to commit)
            echo "'$purple'"$(__git_ps1 " {%s}"); \
        else \
            # Clean repository (nothing to commit)
            echo "'$blue'"$(__git_ps1 " (%s)"); \
        fi;
    fi)'

#if [ -f ~/.git-prompt.sh ]; then
#    source ~/.git-prompt.sh
#    ps1_3=$ps1_git
#else
    ps1_3=
#fi

source ~/.git-completion.bash
export PS1=$title$ps1_0$ps1_3$ps1_9
# }}}
# Aliases {{{

# Cygwin aliases
alias browse='explorer $(cygpath --windows $(pwd))'

# Default to human readable figures
alias df='df -h'
alias du='du -hi'

# Misc
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -h --color=auto'                # classify files in colour
alias lx='ls -lXB'    # Sort by extensions.
alias lk='ls -lSr'    # Sort by size, biggest last.
alias lt='ls -ltr'    # Sort by date, most recent last.
alias lc='ls -ltcr'   # Sort by/show change time, most recent last.
alias lu='ls -ltur'   # Sort by/show access time, most recent last.
alias ll='ls -lv --group-directories-first'
alias lr='ll -R'
alias la='ll -a'

alias vi='vim'
alias tree='tree -Csuh' # Nice alternative to 'recursive ls'

# My own things...
alias tmux="TERM=screen-256color tmux -2"

# Short aliases
alias h='history'
alias j='jobs'
alias ..='cd ..'

alias path='echo -e ${PATH//:/\\n}'

# Other tools
alias agsrc='ag --color-match="31;40" -U -S -G "[.](c|h|inc|def|txt|ldf|asm)$"'
alias agc='ag --color-match="31;40" -U -S -G "[.](c|h)$"'
alias agasm='ag --color-match="31;40" -U -S -G "[.](asm|inc)$"'
alias agdef='ag --color-match="31;40" -U -S -G "[.](def)$"'

# Etel tools
alias etreg='etreg.bat'
alias etver='etver.bat'

alias ct="cleartool"
alias taf="vim ~/notes/taf.rst"
# }}}
# Shelloptions (shopt) {{{
shopt -s cdspell                              # Autocorrect mistyped directory
shopt -s autocd                               # Automatically add cd before known dir names
shopt -s dirspell
shopt -s globstar
shopt -s extglob
# }}}
# Functions {{{
title () {
    echo -ne "\e]0;$1\a"
}
# }}}

# vim:foldmethod=marker:foldlevel=0:tw=80
