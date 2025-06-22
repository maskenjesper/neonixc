{localUsers, ...}: {

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        vivaldi-bin
        zen-twilight
        zen
      '';
      mode = "0755";
    };
  };

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = localUsers;
  };
}
