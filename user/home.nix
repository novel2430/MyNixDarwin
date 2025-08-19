{pkgs, ...}:
{
  home.stateVersion = "25.05";

  imports = [
    ./packages.nix
    ./config
  ];

}
