{ pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "novel2430";
    userEmail = "novel2430@163.com";
    extraConfig = {
      init.defaultbranch = "main";
    };
  };
}
