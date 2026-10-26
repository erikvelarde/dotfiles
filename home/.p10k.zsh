# ~/.p10k.zsh - Camila lean prompt
#
#    erick@coding/projects/app  main !2 ?1 ⇡1               ✘ 1  3s  1
#   ❯
#
[[ -f ~/.colorss.sh ]] && source ~/.colorss.sh

() {
  emulate -L zsh -o extended_glob

  # Elements
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon                 # Arch logo
    userpath                # user@path with custom colors (prompt_userpath below)
    vcs                     # git branch + status
    newline
    prompt_char             # ❯ / ❮ depending on vi mode
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code, only on error
    command_execution_time  # duration of the last slow command
    background_jobs         # jobs running in background
  )

  # Basic settings
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_MODE=nerdfont-v3
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true   # breathing room between commands
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # Old prompts collapse to just "❯ command" (keeps scrollback clean)
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

  # Lean layout: no backgrounds, no separators, single space between segments
  typeset -g POWERLEVEL9K_BACKGROUND=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER// }'

  # No multiline frame, no gap filler
  typeset -g POWERLEVEL9K_MULTILINE_{FIRST,NEWLINE,LAST}_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_{FIRST,NEWLINE,LAST}_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '

  # OS icon
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$blue
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=$'\uF303'

  # CUSTOM SEGMENT: user@path with different colors
  # Home prefix is removed; long paths are shortened to …/last/three/dirs
  function prompt_userpath() {
    local current_path="${PWD/#$HOME\//}"
    [[ $PWD == $HOME ]] && current_path='~'

    local -a parts=(${(s:/:)current_path})
    if (( ${#parts} > 4 )); then
      current_path="…/${(j:/:)parts[-3,-1]}"
    fi

    local lock=''
    [[ -w $PWD ]] || lock=" %F{$red}"$'\uF023'

    p10k segment -t "%F{$yellow}%n%F{$comment}@%B%F{$blue}${current_path//\%/%%}%b${lock}%f"
  }
  function instant_prompt_userpath() { prompt_userpath }

  # Git VCS: " main ⇣1⇡2 *1 ~3 +2 !1 ?4"
  function my_git_formatter() {
    emulate -L zsh
    if [[ -n $P9K_CONTENT ]]; then
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    local res
    local branch=${VCS_STATUS_LOCAL_BRANCH:-@${VCS_STATUS_COMMIT[1,8]}}
    (( $#branch > 32 )) && branch[13,-13]="…"
    res+="%F{$magenta}"$'\uE0A0'" ${branch//\%/%%}"

    [[ -n $VCS_STATUS_TAG ]] && res+=" %F{$comment}#${VCS_STATUS_TAG//\%/%%}"

    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" %F{$cyan}⇣${VCS_STATUS_COMMITS_BEHIND}"
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="%F{$cyan}⇡${VCS_STATUS_COMMITS_AHEAD}"
    (( VCS_STATUS_STASHES        )) && res+=" %F{$comment}*${VCS_STATUS_STASHES}"
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" %F{$red}${VCS_STATUS_ACTION}"
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" %F{$red}~${VCS_STATUS_NUM_CONFLICTED}"
    (( VCS_STATUS_NUM_STAGED     )) && res+=" %F{$green}+${VCS_STATUS_NUM_STAGED}"
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" %F{$operator}!${VCS_STATUS_NUM_UNSTAGED}"
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" %F{$yellow}?${VCS_STATUS_NUM_UNTRACKED}"

    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null

  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=$comment
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  # Prompt character: ❯ insert, ❮ normal, V visual, ▶ overwrite
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$magenta
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''

  # Status: hidden on success, red ✘ code on failure
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=false
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$red
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=$red
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=$red
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'

  # Execution time: shown when a command takes 3s or more
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$operator
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=$'\uF017'

  # Background jobs
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=$cyan
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION=$'\uF013'
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}
