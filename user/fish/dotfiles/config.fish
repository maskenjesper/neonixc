#if status is-login
#    if uwsm check may-start && uwsm select
#        exec systemd-cat -t uwsm_start uwsm start default
#    end
#end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ""
    set -gx EDITOR vim
end

bind \cj down-or-search
bind \ck up-or-search


bind \co lfcd

bind \ce tmux-sessionizer
bind \cw 'tmux-sessionizer $(pwd)'
bind \cr 'tmux-sessionizer $HOME'

function vv
    vim .
end
function vt
    tvim .
end



# just global
function jj
    just -g $1
end
function jjl
    just -gl
end
function jjs
    just -g sync
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
    systemd-cat -t uwsm_start uwsm start default
end
function lg
    lazygit
end

direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow
