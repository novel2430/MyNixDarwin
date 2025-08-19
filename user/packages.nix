{pkgs, ...}:
{
  home.packages = with pkgs; [
    fastfetch
    tmux
    jdk
  ];
}
