function devnew --description "new dev project"
    pushd ~/dev || exit
    set time (date "+%H-%M-%S_%d-%m-%y")
    mkdir $time
    cd $time
    set dir (pwd)

    echo $dir

    tmux-sessionizer $dir
end
