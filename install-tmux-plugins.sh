#!/usr/bin/env bash

tmux_command=$(command -v tmux)
if [ -z $tmux_command ]
then
    echo "You need to install tmux"
    exit 1
fi

rm -rf ~/.tmux/plugins/tpm/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf
