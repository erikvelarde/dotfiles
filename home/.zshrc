if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.powerlevel10k/powerlevel10k.zsh-theme

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
export FZF_DEFAULT_OPTS='--color=info:#f8f8f2,spinner:#f8f8f2,pointer:#50fa7b,hl:#50fa7b,fg:#f8f8f2,header:#6272a4'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind='ctrl-o:execute(vim {})+abort'"

alias nv="nvim \$(fzf)"
alias n="nvim ."
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

source ~/.powerlevel10k/powerlevel10k.zsh-theme
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
