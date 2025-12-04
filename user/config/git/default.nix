{ pkgs, ...}:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "novel2430";
      email = "novel2430@163.com";
    };
    settings = {
      init.defaultbranch = "main";
    };
  };
}
