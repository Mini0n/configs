# ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
# .mini0n-bash.sh
#
# bash configuration file 
# by @mini0n
#
# Tested w/ bash 5.2.21 @ ubuntu 24.04.02 LTS
#
# > init_update: 18.Dec.2025
# ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==


# === Parsing git stuff for PS1 ================================================================
# downloaded: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
# downloaded: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

source ~/.git-completion.bash
source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWUPSTREAM="verbose"
# export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# ==== Modifying PS1 =============================
# Info: https://gist.github.com/justintv/168835
PS1=''                                # Start fresh                     
PS1+='\[\033[00;36m\]'                # Scape and color (FG=teal)
PS1+='\[\033[0m\033[0;36m\]'          # Double scape to handle word-wrap
PS1+='\u@\h '                         # "usename@host "
PS1+='\[\033[0;34m\]\w'               # working directory path (FG=blue)
PS1+='\[\033[0;32m\]$(__git_ps1)'     # git branch & status flags (FG=green)
PS1+='\n\[\033[0;35m\]└─ \$ ▶'        # create new line, insert flow symbols, $ and play (FG=purple)
PS1+='\[\033[0m\] '                   # back to no color and a space " "

export PS1

