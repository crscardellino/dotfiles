# Create the second window
new-window -k -c "$HOME/dir1/" -n "name1" -t 1
split-window -c "$HOME/dir1/" -v -p 50
select-pane -t 0

# Create the third window
new-window -k -c "$HOME/dir2/" -n "name2" -t 2
split-window -c "$HOME/dir2/" -v -p 50
select-pane -t 0

# Create nth window
# Similar to above

# Remove the original window and create a new one
new-window -k -c "$HOME/dir0" -n "dir0" -t 0
split-window -c "$HOME/dir0" -v -p 50
split-window -c "$HOME/dir0" -h -p 50
select-pane -t 0
