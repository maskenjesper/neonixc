{...}: {
  services.openssh = {
    enable = true;
    ports = [6845];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = ["jakob"];
    };
  };
  services.fail2ban.enable = true;
}
