# ~/.p10k.zsh - Fixed to remove ~/ and add color separation
[[ -f ~/.colorss.sh ]] && source ~/.colorss.sh

() {
  emulate -L zsh -o extended_glob

  # Elements
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    custom_userpath  # Combined user and path with custom colors
    newline
    prompt_char
  )
  
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    vcs
  )

  # Basic settings
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_MODE=ascii
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
  
  # Background
  typeset -g POWERLEVEL9K_BACKGROUND=$bg
  
  # Clean layout
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
  
  # No spacing
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=''
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=$transparent
  
  # CUSTOM SEGMENT: Combined user@path with different colors
  function prompt_custom_userpath() {
    # Get username
    local username="%n"
    
    # Get current directory, remove ~/ prefix completely
    local current_path="${PWD/#$HOME\//}"  # Remove /home/erick/ or ~/
    
    # If we're in home directory, show empty or just "~"?
    if [[ "$current_path" == "" ]]; then
      current_path=""  # Empty when in home
    fi
    
    # Format with different colors
    echo -n "%F{$yellow}${username}%F{$fg}@%F{$blue}${current_path}%f"
  }
  
  typeset -g POWERLEVEL9K_CUSTOM_USERPATH="prompt_custom_userpath"
  typeset -g POWERLEVEL9K_CUSTOM_USERPATH_BACKGROUND=$alt_bg
  typeset -g POWERLEVEL9K_CUSTOM_USERPATH_FOREGROUND=$fg
  
  # Git VCS
  typeset -g POWERLEVEL9K_VCS_BACKGROUND=$alt_bg
  typeset -g POWERLEVEL9K_VCS_FOREGROUND=$green
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$green
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$yellow
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$red
  
  # Simple git - just branch name
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=''
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${VCS_STATUS_LOCAL_BRANCH}'
  
  # Prompt character
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=$alt_bg
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_FOREGROUND=$magenta  # Use magenta for prompt
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_FOREGROUND=$magenta
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIVIS_FOREGROUND=$magenta
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIOWR_FOREGROUND=$magenta
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VICMD_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIVIS_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIOWR_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION='>'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION='>'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_CONTENT_EXPANSION='#'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VICMD_CONTENT_EXPANSION='#'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}
