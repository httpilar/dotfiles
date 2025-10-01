# Personal configuration for Zsh

# My personal environment variables go here
export EDITOR="code -w" # waits to close file before proceding
export GPG_TTY=$(tty) # GPG signing bugs solved
export XDG_CONFIG_HOME=~/.config

# My personal PATH additions go here

# Exports and PATH additions required by 3rd party tools (e.g. pnpm,
# Bun, Deno, Homebrew) go here

# Autoloads
  autoload run-help
  # but!
  # as run-help is normally aliased to man,we remove the alias
  unalias run-help 2>/dev/null

# zsh parameters
  HISTFILE="$ZDOTDIR/.zsh_history"

  # "The maximum number of events stored in the internal history list."
  HISTSIZE=11000

  # "The maximum number of history events to save in the history file."
  SAVEHIST=10000

# zsh options
  # "If a completion is performed with the cursor within a word, and a
  # full completion is inserted, the cursor is moved to the end of the
  # word."
  setopt always_to_end

  setopt auto_cd # enters path without cd

  # autocompletes with tab
  setopt auto_menu
  unsetopt menu_complete

  # If unset, the cursor is set to the end of the word if completion is
  # started. Otherwise it stays there and completion is done from both
  # ends.
  setopt complete_in_word

  # Remove command lines from the history list when the first character
  # on the line is a space, or when one of the expanded aliases contains
  # a leading space. Only normal aliases (not global or suffix aliases)
  # have this behaviour. Note that the command lingers in the internal
  # history until the next command is entered before it vanishes,
  # allowing you to briefly reuse or edit the line. If you want to make
  # it vanish right away without entering another command, type a space
  # and press return.
  setopt hist_ignore_space

  # Ennable comments in the terminal. Nice when copying and
  # pasting from documentation/tutorials, and disable part of
  # a command pulled up from history.
  setopt interactivecomments

  # "Beep on an ambiguous completion. More accurately, this forces the
  # completion widgets to return status 1 on an ambiguous completion,
  # which causes the shell to beep if the option BEEP is also set; this
  # may be modified if completion is called from a user-defined widget."
  # https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
  unsetopt list_beep

  # If set, parameter expansion, command substitution and arithmetic
  # expansion are performed in prompts. Substitutions within prompts do
  # not affect the command status.
  setopt prompt_subst

  # This option both imports new commands from the history file, and
  # also causes your typed commands to be appended to the history file
  # (the latter is like specifying INC_APPEND_HISTORY, which should be
  # turned off if this option is in effect). The history lines are also
  # output with timestamps ala EXTENDED_HISTORY (which makes it easier
  # to find the spot where we left off reading the file after it gets
  # re-written).
  setopt share_history

# zsh zle
  # "[none:] No highlighting is applied to the given context.
  zle_highlight=('paste:none')

# zsh zstyle
  zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compcache

  # Added case insensitivity and dash/underscore insensitivity
  typeset -A match_specifications=(
    [any_before_any]='r:|?=**'
    [any_before_dot]='r:|[.]=**'
    [any_before_word]='l:|=*'
    [case_and_dash_insensitive]='m:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}'
    [nonseparators_after_any_before_separator]='r:?||[-_ \]=*'
    [separator_after_any]='l:?|=[-_ \]'
  )
  zstyle ':completion:*' matcher-list \
      "$match_specifications[case_and_dash_insensitive] $match_specifications[any_before_dot] $match_specifications[any_before_word]" \
      "+$match_specifications[nonseparators_after_any_before_separator] $match_specifications[separator_after_any]" \
      "$match_specifications[case_and_dash_insensitive] $match_specifications[any_before_any]"
  unset match_specifications

  # Show completion suggestions in a menu
  zstyle ':completion:*' menu select

  # Makes shell remember completion results and goes faster
  zstyle ':completion::complete:*' use-cache yes

# Aliases go here

# Widgets go here

# Load plugin manager here
# see https://olets.dev/uses/#terminal

# Load and configure plugins here
# see https://olets.dev/uses/#terminal

# Run compinit here
# (If you use a plugin manager, check its documentation. Some have
# their own own idiomatic commands, or handle it for you.)
