# Filter windows' PATH
function filter_mnt_paths --description "Filters out /mnt/ paths from the global PATH variable"
    set -l new_path # Create a local list to build the new PATH

    for p in $PATH # Iterate over each element in the current PATH
        # If a path does NOT start with /mnt/ (case-sensitive), add it to our new_path list
        if not string match --regex '^/mnt/' "$p"
            set new_path $new_path "$p"
        end
    end

    # Replace the global PATH variable with the filtered list
    set -gx PATH $new_path
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    filter_mnt_paths

    pyenv init - | source

    if not set -q TMUX # If tmux is not activated
        tmux
    end
end
