if status is-interactive
    # Commands to run in interactive sessions can go here
    pyenv init - | source

    if not set -q TMUX # If tmux is not activated
        tmux
    end
end
