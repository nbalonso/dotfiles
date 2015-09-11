
export LC_CTYPE="en_IE.UTF-8" #irish unicode

if [[ ${OSTYPE} == 'darwin'* ]]; then

    # Color things with grc
    if [ -f $(which brew) ] && [ -f "$(brew --prefix)/etc/grc.bashrc" ]; then
        source "$(brew --prefix)/etc/grc.bashrc"
    fi
    # Add tab completion for many Bash commands
    if [ -f $(which brew) ] && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        source "$(brew --prefix)/etc/bash_completion"
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi

    #load powerline if installed
    if [ -f $(which powerline-daemon) ]; then
        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
    fi

#elif [[ ${OSTYPE} == 'linux-gnu' ]]; then
    #load powerline if installed
#    if [ -f `which powerline-daemon` ]; then
#        powerline-daemon -q
#        POWERLINE_BASH_CONTINUATION=1
#        POWERLINE_BASH_SELECT=1
#        source /usr/share/powerline/bash/powerline.sh
#    fi

fi

alias ll='ls -l'              #ll as RHEL
alias ..='cd ..'              #shortcut
alias tailf='tail -f'         #tailf as RHEL
alias grep='grep --color'     #always highlight

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Append to the Bash history file, rather than overwriting it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

#add admin tools to my path
#export PATH="/usr/local/sbin:$PATH"

# a opens Atom
function a() {
    if [ $# -eq 0 ]; then
        atom .
    else
        atom "$@"
    fi
}

# v opens Vim
function v() {
    if [ $# -eq 0 ]; then
        vim .
    else
        vim "$@"
    fi
}

# o opens in OS X
function o() {
    if [ $# -eq 0 ]; then
        open .
    else
        open "$@"
    fi
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}
