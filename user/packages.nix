{pkgs, ...}:
{
  home.packages = with pkgs; [
    fastfetch
    tmux
    yt-dlp
    nodejs_24
    ffmpeg
    cmatrix
    yazi
  ];
}
