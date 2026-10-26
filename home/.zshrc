if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""  # prompt is handled by powerlevel10k below

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ── UI: Catppuccin Mocha palette (variables come from ~/.colorss.sh) ─────
# Completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*:descriptions' format "%F{$magenta}󰁔 %B%d%b%f"
zstyle ':completion:*:messages' format "%F{$comment}%d%f"
zstyle ':completion:*:warnings' format "%F{$red}✘ no matches for: %d%f"
zstyle ':completion:*:corrections' format "%F{$yellow}%d (errors: %e)%f"

# Autosuggestions (ghost text)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$comment"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (plugin itself is sourced at the very end of this file)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]="fg=$green"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$green"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$green"
ZSH_HIGHLIGHT_STYLES[function]="fg=$green"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$green,underline"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$red,bold"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=$operator"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=$operator"
ZSH_HIGHLIGHT_STYLES[path]="fg=$directory,underline"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$blue"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$accent"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$accent"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$yellow"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$yellow"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$yellow"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=$pink"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[comment]="fg=$comment,italic"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=$green"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set vim as terminal mode
set -o vi
bindkey -M viins 'jk' vi-cmd-mode

# Load Angular CLI autocompletion.
# source <(ng completion script)
export PATH=/home/erick/.nvm/versions/node/v18.16.1/bin:/usr/condabin:/home/erick/.cargo/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/erick/.config/pycopy
export PATH=/home/erick/.nvm/versions/node/v18.16.1/bin:/usr/condabin:/home/erick/.cargo/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/erick/.config/pycopy:/home/erick/.config/java-features
export PATH=/home/erick/.nvm/versions/node/v18.16.1/bin:/usr/condabin:/home/erick/.cargo/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/erick/.config/pycopy:/home/erick/.config/java-features:/home/erick/.config/java-craft
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --border=rounded --info=inline-right \
  --prompt='❯ ' --pointer='▶' --marker='✓' --separator='─' --scrollbar='│' \
  --color=bg:-1,bg+:$surface,fg:$identifier,fg+:$fg,hl:$magenta,hl+:$magenta \
  --color=border:$surface,label:$accent,prompt:$magenta,pointer:$pink,marker:$green \
  --color=info:$comment,spinner:$pink,header:$blue,query:$fg,gutter:-1"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind='ctrl-o:execute(vim {})+abort'"

alias nv="nvim \$(fzf)"
alias n="nvim -c 'Telescope find_files'"
alias v="nvim"
alias trestore="$HOME/.dotfiles/cfg/tmux/scripts/tmux-restore"
alias tdelete="$HOME/.dotfiles/cfg/tmux/scripts/tmux-delete"
# alias ls="eza"
export PATH=/home/erick/.nvm/versions/node/v18.16.1/bin:/usr/condabin:/home/erick/.cargo/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/erick/.config/pycopy:/home/erick/.config/java-features:/home/erick/.config/java-craft:/home/erick/.config/pycopy

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Changing "ls" to "eza"
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -alF --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias l.='eza -a | egrep "^\."'

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Created by `pipx` on 2024-07-07 17:54:21
export PATH="$PATH:/home/erick/.local/bin"

# vcpkg setup
export VCPKG_ROOT=/opt/vcpkg
export PATH=$VCPKG_ROOT:$PATH

# auditer 
alias auditer="~/coding/projects/codeAuditerAI/auditer"

# flutter
export PATH="$HOME/.flutter_install/flutter/bin:$PATH"

# Android Studio
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH


export PATH="$HOME/go/bin/lazygit:$PATH"
eval "$(fzf --zsh)"
# bindkey -M vicmd v edit-command-line

# clang
export CLANG_FORMAT_STYLE=file
export CLANG_FORMAT_CONFIG=~/.config/nvim/clang/.clang-format
export PATH=/home/erick/go/bin/lazygit:/home/erick/Android/Sdk/platform-tools:/home/erick/Android/Sdk/cmdline-tools/bin:/home/erick/.flutter_install/flutter/bin:/opt/vcpkg:/home/erick/.nvm/versions/node/v20.14.0/bin:/usr/condabin:/home/erick/.cargo/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/erick/.config/pycopy:/home/erick/.config/java-features:/home/erick/.config/java-craft:/home/erick/.config/pycopy:/home/erick/.config/composer/vendor/bin:/home/erick/.local/bin:/home/erick/.config/pycopy

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export ANDROID_HOME="/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"
export PATH="$HOME/.dekploy/bin:$PATH"

export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export PATH="$HOME/development/flutter/bin:$PATH"

# opencode
export PATH=/home/erick/.opencode/bin:$PATH

export PATH="$HOME/.pub-cache/bin:$PATH"

# must stay last: wraps all widgets defined above
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
