# -------------
# Try to get close to normal colors in tmux
# -------------
set -g default-terminal "screen-256color"

# -------------
# start with window 1 (instead of 0)
# -------------
set -g base-index 1

# -------------
# start with pane 1
# -------------
set -g pane-base-index 1

# -------------
# status line
# -------------
set -g status-justify left
set -g status-bg black
set -g status-fg white
set -g status-interval 4

# -------------
# window status
# -------------
setw -g window-status-format "#[fg=black]#[bg=colour7] #I #[fg=black]#[bg=colour15] #W "
setw -g window-status-current-format "#[fg=colour8]#[bg=white] #I #[bg=colour69]#[fg=white] #W "
setw -g window-status-current-style bg=black
setw -g window-status-current-style fg=yellow
setw -g window-status-style bg=black
setw -g window-status-style fg=blue
setw -g window-status-style default
setw -g mode-style fg=blue,bg=black

# -------------
# Info on left (no session display)
# -------------
set -g status-left ''
set -g status-right-length 150
set -g status-right '#[fg=colour69] #(hostname)@#(hostname -I | cut -d " " -f 1) | #[fg=colour160]♥ #[fg=colour69]#(acpi -b | cut -d" " -f4 | cut -d"%" -f1)% | %H:%M | %Y-%m-%d '
