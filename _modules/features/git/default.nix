{...}: {

    flake.imports = [

    ];

    flake.modules = {

        homeManager.git = {
          programs.git = {
            enable = true;
            userName = "jakob";
            userEmail = "noreply@email.com";
            extraConfig = {
              init.defaultBranch = "main";
            };
          };
          programs.lazygit.enable = true;

        };

    };

}
