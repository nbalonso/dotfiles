
#set all locales just in case
export LANG=en_IE.UTF-8       #irish unicode
export LC_ALL=en_IE.UTF-8     #irish unicode

#add admin tools to my path
#export PATH="/usr/local/sbin:$PATH"

#load binaries from my home
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

#if brew then load first
if [ -d "/usr/local/sbin" ]; then
    PATH="/usr/local/sbin:$PATH"
fi

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

elif [[ ${OSTYPE} == 'linux-gnu' ]]; then
    #load powerline if installed
    if [ -f `which powerline-daemon` ]; then
        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        source ~/.local/lib/python2.6/site-packages/powerline/bindings/bash/powerline.sh
    fi

fi

#shortcuts
alias rm='rm -i'              #ya' know safety
alias vi='vim'                #VIM ftw
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
        local arg=-sh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}
