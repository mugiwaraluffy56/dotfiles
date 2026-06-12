# Crimson — Powerlevel10k config
# Palette: red · black · blue only
# Style: powerline slant, two-line, frame

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

{
() {
  emulate -L zsh -o extended_glob
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # ── Prompt segments ──────────────────────────────────
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir
    vcs
    newline
    prompt_char
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    virtualenv
    node_version
    newline
  )

  typeset -g POWERLEVEL9K_MODE=nerdfont-v2
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # ── Frame connectors — muted dark gray ───────────────
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%238F╭─'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%238F├─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%238F╰─'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%238F─╮'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%238F─┤'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%238F─╯'

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='─'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=238

  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
  typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'

  # ── Powerline slant separators ────────────────────────
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

  # ── os_icon — blue (unused, kept for reference) ──────
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=231
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=27

  # ── prompt_char ───────────────────────────────────────
  # blue (33) on success, red (160) on error
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=33
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=160
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

  # ── dir — electric blue bg, white fg ─────────────────
  # bg: 27 (#005fff electric blue) | fg: 231 (white)
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=27
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=231
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=153
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=231
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  local anchor_files=(
    .bzr .citc .git .hg .node-version .python-version .go-version
    .ruby-version .lua-version .java-version .tool-versions .mise.toml
    .shorten_folder_marker .svn .terraform CVS Cargo.toml composer.json
    go.mod package.json stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3
  typeset -g POWERLEVEL9K_DIR_CLASSES=(
    '~/work(/*)#'  WORK     ''
    '~(/*)#'       HOME     ''
    '*'            DEFAULT  ''
  )
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND=160
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND=231
  typeset -g POWERLEVEL9K_LOCK_ICON='⊘'

  # ── vcs — git status ──────────────────────────────────
  # Clean:     dark blue  (18)  bg | white fg (231)
  # Modified:  vivid red  (160) bg | white fg
  # Untracked: dark red   (88)  bg | white fg
  # Conflict:  bright red (196) bg | white fg
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=18
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=231
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=160
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=231
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=88
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=231
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=196
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=231

  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0.05
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  # ── status ────────────────────────────────────────────
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=233
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=160
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=233
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false

  # ── command_execution_time — red on dark ─────────────
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=160
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=233
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=

  # ── virtualenv / pyenv — blue on dark ────────────────
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=233
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=33
  typeset -g POWERLEVEL9K_VIRTUALENV_GENERIC_NAMES=()
  typeset -g POWERLEVEL9K_PYENV_BACKGROUND=233
  typeset -g POWERLEVEL9K_PYENV_FOREGROUND=33
  typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true
  typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION=

  # ── nvm / node — blue on dark ────────────────────────
  typeset -g POWERLEVEL9K_NVM_BACKGROUND=233
  typeset -g POWERLEVEL9K_NVM_FOREGROUND=33
  typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=233
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=33
  typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true

  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

}
} always {
  'builtin' 'unset' 'p10k_config_opts'
}
