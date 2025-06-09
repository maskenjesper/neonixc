complete -c flakeinit -a 'flutter dart nodejs wireguard lua elixir phoenix'
function flakeinit

    if test (count $argv) -eq 1
        set e $argv[1]
        nix flake init -t ~/nixt#$e
        direnv allow
    else
        echo "Need to specify name"
    end
end
