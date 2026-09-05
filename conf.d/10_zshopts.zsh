# SPDX-FileCopyrightText: 2026 mattmc3
#
# SPDX-License-Identifier: MIT

#
# Set ZSH options
#

# Set completion options.
setopt always_to_end    # Move cursor to the end of a completed word.
setopt auto_list        # Automatically list choices on ambiguous completion.
setopt auto_menu        # Show completion menu on a successive tab press.
setopt auto_param_slash # If completed parameter is a directory, add a trailing slash.
setopt complete_in_word # Complete from both ends of a word.
setopt path_dirs        # Perform path search even on command names with slashes.
setopt NO_flow_control  # Disable start/stop characters in shell editor.
setopt NO_list_beep     # Do not beep on ambiguous completion.
setopt NO_menu_complete # Do not autoselect the first completion entry.

# Set Zsh options related to directories, globbing, and I/O.
setopt auto_pushd        # Make cd push the old directory onto the dirstack.
setopt pushd_ignore_dups # Don't push multiple copies of a directory onto the dirstack.
setopt pushd_minus       # Exchanges meanings of +/- when navigating the dirstack.
setopt pushd_silent      # Do not print the directory stack after pushd or popd.
setopt pushd_to_home     # Push to home directory when no argument is given.
setopt multios           # Write to multiple descriptors.
setopt extended_glob     # Use extended globbing syntax (#,~,^).
setopt glob_dots         # Don't hide dotfiles from glob patterns.
setopt NO_clobber        # Don't overwrite files with >. Use >| to bypass.
setopt NO_rm_star_silent # Ask for confirmation for `rm *' or `rm path/*'

# Set Zsh editor options.
setopt NO_beep # Do not beep on error in line editor.

# Set general Zsh options.
setopt combining_chars      # Combine 0-len chars with the base character (eg: accents).
setopt interactive_comments # Enable comments in interactive shell.
setopt rc_quotes            # Allow 'Hitchhikers''s Guide' instead of 'Hitchhikers'\''s Guide'.
setopt NO_mail_warning      # Don't print a warning message if a mail file has been accessed.

# Set Zsh options related to job control.
setopt auto_resume    # Attempt to resume existing job before creating a new process.
setopt long_list_jobs # List jobs in the long format by default.
setopt notify         # Report status of background jobs immediately.
setopt NO_bg_nice     # Don't run all background jobs at a lower priority.
setopt NO_check_jobs  # Don't report on jobs when shell exit.
setopt NO_hup         # Don't kill jobs on shell exit.

# Set Zsh options related to history.
setopt bang_hist              # Treat the '!' character specially during expansion.
setopt extended_history       # Write the history file in the ':start:elapsed;command' format.
setopt hist_expire_dups_first # Expire a duplicate event first when trimming history.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_all_dups   # Delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_dups       # Do not record an event that was just recorded again.
setopt hist_ignore_space      # Do not record an event starting with a space.
setopt hist_reduce_blanks     # Remove extra blanks from commands added to the history list.
setopt hist_save_no_dups      # Do not write a duplicate event to the history file.
setopt hist_verify            # Do not execute immediately upon history expansion.
setopt inc_append_history     # Write to the history file immediately, not when the shell exits.
setopt NO_hist_beep           # Don't beep when accessing non-existent history.
setopt NO_share_history       # Don't share history between all sessions.

# Prompt options
setopt prompt_subst # Expand parameters in prompt variables.
