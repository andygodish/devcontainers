# Path to your oh-my-zsh configuration.
ZSH="/root/.oh-my-zsh"

# Disable odd message regading completions on mac when doing 'sudo su'
ZSH_DISABLE_COMPFIX=true


# Colorize output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# For Solarized
export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format:count plugins=(rails git textmate ruby lighthouse)
default_plugins=(
    cp
    gnu-utils
)

custom_plugins=(
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
)

if [[ -f "${HOME}/.zsh/plugins" ]]; then
    . "${HOME}/.zshrc/plugins"
    plugins=( ${default_plugins[@]} ${custom_plugins[@]} )
elif [[ -d "${ZSH}/custom/plugins" ]]; then
    plugins=( ${default_plugins[@]} ${custom_plugins[@]} )
else
    plugins=${default_plugins}
fi

# Make zsh look like fish:
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:${FPATH}
fi

source "${ZSH}/oh-my-zsh.sh"

# Customize to your needs...
export PATH="${PATH}:${HOME}/.krew/bin"                         # Krew: installed binaries
export PATH="${PATH}:${HOME}/.rbenv/bin:${HOME}/.rbenv/shims"   # Rbenv: managing ruby versions
export PATH="${PATH}:${HOME}/.cargo/bin"                        # Cargo: installed crates
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/bin"            # User-wide installed binaries
export GPG_TTY=$(tty)
export EDITOR=vim visudo
export SHELL="/bin/zsh"
export LC_TYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Load aliases
if [ -f "${HOME}/.zsh/aliases" ]; then
    source "${HOME}/.zsh/aliases"
fi

# Load custom configs
if [ -d "${HOME}/.zsh/conf.d" ]; then
    for i in "${HOME}/.zsh/conf.d/*.sh"; do
        if [ -r "${i}" ]; then
            . "${i}"
        fi
    done
fi

# Load Rails environment variables if present
if [ -f "${HOME}/.rails.env" ]; then
    source "${HOME}/.rails.env"
fi

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh