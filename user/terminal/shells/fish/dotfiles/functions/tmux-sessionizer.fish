function tmux-sessionizer --description "sessionizer"
    
    # use argument as path
    if test (count $argv) -eq 1
        set session_path $argv[1]
    # use fzf for path
    else
        set session_path (find ~/exercism ~/ ~/nixt ~/neonixc ~/dev ~/.config -mindepth 0 -type d | fzf)
    end

    if test -z "$session_path"
        return 0
    end
    
    set session_name (basename "$session_path" | tr . _)

    # make sure the server is started
    tmux start-server

    # create session if it doesn't already exist
    if not tmux has-session -t=$session_name &> /dev/null
        tmux new-session -ds $session_name -c $session_path
    end

    # outside tmux
    if test -z "$TMUX" 
        tmux attach-session -t $session_name
    # inside tmux
    else 
        tmux switch-client -t $session_name
    end

end
