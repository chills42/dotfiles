export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "plugins/brew", from:oh-my-zsh
zplug 'ryutok/rust-zsh-completions'
zplug "jeffreytse/zsh-vi-mode"
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/zplug"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load

autoload -U promptinit; promptinit

zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes

prompt pure

fpath=(/usr/local/opt/zplug/repos/zsh-users/zsh-completions/src/ $fpath)

# Update History Settings
export HISTFILE=~/.zsh_history # Where it gets saved
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history # Don't overwrite, append!
setopt INC_APPEND_HISTORY # Write after each command
setopt hist_expire_dups_first # Expire duplicate entries first when trimming history.
setopt hist_fcntl_lock # use OS file locking
setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate.
setopt hist_lex_words # better word splitting, but more CPU heavy
setopt hist_reduce_blanks # Remove superfluous blanks before recording entry.
setopt hist_save_no_dups # Don't write duplicate entries in the history file.
setopt share_history # share history between multiple shells
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
HIST_STAMPS="yyyy-mm-dd"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search # Up
bindkey "$terminfo[kcud1]" down-line-or-beginning-search # Down

# User configuration

export EDITOR='vim'

[[ -f ~/.aliases ]] && source ~/.aliases

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

## Monkey with the PATH
export PATH="$HOME/.local/bin:/usr/local/bin:$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.conduit/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH=~/.dotfiles/bin:${PATH}


# Rust build config
export RUSTC_WRAPPER=sccache


export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'




export PATH="$HOME/.poetry/bin:$PATH"
