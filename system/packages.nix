{pkgs, ...}:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim 
    git 
    neovim 
    wget
    curl
    socat
    tree 
    cmake
    htop
    ninja
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    flex
    bison
    jdk
    jdk17
  ];
}
