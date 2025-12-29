{...}: {
  users.extraGroups.docker.members = ["jakob"];
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
