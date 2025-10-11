{...}: {

    flake.imports = [

    ];

    flake.modules = {

        homeManager.gh = {
            programs.gh.enable = true;

        };

    };

}
