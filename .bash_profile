
#platform=$(uname)            #OS detection
if [[ ${OSTYPE} == 'darwin'* ]]; then
    export LC_CTYPE="utf-8"                   #Set to unicode
    # Color things with grc
    if which brew > /dev/null && [ -f "$(brew --prefix)/etc/grc.bashrc" ]; then
        source "`brew --prefix`/etc/grc.bashrc"
    fi
    # Add tab completion for many Bash commands
    if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        source "$(brew --prefix)/etc/bash_completion";
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion;
    fi

#elif [[ ${OSTYPE} == 'linux-gnu' ]]; then

fi

alias ll='ls -l'              #ll as RHEL
alias ..='cd ..'              #shortcut
alias tailf='tail -f'         #tailf as RHEL

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

export PATH="/usr/local/sbin:$PATH"
# Add `~/bin` to the `$PATH`
#export PATH="$HOME/bin:$PATH";
