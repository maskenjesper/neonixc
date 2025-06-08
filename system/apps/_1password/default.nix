{users, ...}: {

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        vivaldi-bin
        zen-wrapped
      '';
      mode = "0755";
    };
  };

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = users;
  };
}
