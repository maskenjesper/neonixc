#if tty > /dev/null
#    #if uwsm check may-start && uwsm select
#    #    exec systemd-cat -t uwsm_start uwsm start default
#    #end
#    #set -U fish_greeting "login"
#    #set -gx EDITOR vim
#    echo login
#end
#
#if status is-interactive
#    # Commands to run in interactive sessions can go here
#    #set -U fish_greeting "interactive"
#    #set -gx EDITOR vim
#    echo interactive
#end

bind \cj down-or-search
bind \ck up-or-search

bind \co lfcd

bind \ce tmux-sessionizer
bind \cw 'tmux-sessionizer $(pwd)'
bind \cr 'tmux-sessionizer $HOME'

function sux
    # use argument as path
    set x (systemctl status xremap | grep -c running)
    if test $x -eq 1
        sudo systemctl stop xremap
    else
        sudo systemctl start xremap
    end
end

function dallow
    direnv allow
end

function me
    tmux-sessionizer
end
function mw
    tmux-sessionizer $(pwd)
end
function mr
    tmux-sessionizer $HOME
end

function vv
    tvim .
end

function dn
    devnew
end
function tm
    tmux attach
end
function cls
    clear
end
function uwu
    #systemd-cat -t uwsm_start uwsm start default
    exec uwsm start default
end
function lg
    lazygit
end

direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow
