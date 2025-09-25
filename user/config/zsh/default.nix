{pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = false;
    shellAliases = {
      showimage = "sudo nix-env --profile /nix/var/nix/profiles/system --list-generations";
      delimage = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations";
      ls = "${pkgs.eza}/bin/eza --icons auto";
      l = "ls -la";
      neofetch = "${pkgs.fastfetch}/bin/fastfetch";
      gitall = "git add . && git commit -m 'update' && git push";
      v = "nvim";
      cat = "${pkgs.bat}/bin/bat -p";
      tree = "${pkgs.tree}/bin/tree -C -A";
      grep = "${pkgs.ripgrep}/bin/rg --encoding=UTF-8 -i";
      darwin-rebuild = "sudo http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890 darwin-rebuild";
      yz = "${pkgs.yazi}/bin/yazi";
    };
    initContent = ''
      setopt hist_verify
      setopt NO_BEEP
      setopt HIST_IGNORE_ALL_DUPS
      setopt no_nomatch
      
      bindkey '^?' backward-delete-char
      bindkey '^[[3~' delete-char
      bindkey '^L' clear-screen


      zstyle ":completion:*" menu select
      zstyle ":completion:*" special-dirs true
      zstyle ":completion:*" list-colors ''${(s.:.)LS_COLORS} 

      autoload -Uz vcs_info

      preexec() {
        print -Pn "\e]0;$1\a"
      }
      precmd() { 
        vcs_info 
        print -Pn "\e]0;%n@%m:%~\a"
        
      }
      setopt prompt_subst
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' stagedstr '%F{green}+%f'
      zstyle ':vcs_info:git:*' unstagedstr '%F{yellow}!%f'
      zstyle ':vcs_info:git:*' formats '(%F{red}%b%f)%u%c '

      export PROMPT='%B%F{blue}[%n:%F{green}%~%F{blue}]$%f%b ''${vcs_info_msg_0_}'

      # zsh-history-substring-search
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      bindkey '^P' history-substring-search-up
      bindkey '^N' history-substring-search-down
      # bindkey '^[[1;5A' history-substring-search-up
      # bindkey '^[[1;5B' history-substring-search-down

      # zsh-syntax-highlighting -- Must Last
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    '';
    profileExtra = ''
      export EDITOR="nvim"
      export http_proxy="http://127.0.0.1:7890"
      export https_proxy="http://127.0.0.1:7890"
    '';
  };
}
