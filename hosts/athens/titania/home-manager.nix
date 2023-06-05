{ pkgs, pkgs-stable, ... }: {
  home = {
    stateVersion = "23.11";
  };

  programs = {
    bash.enable = true;
    helix = import ./helix.nix;
    fish = {
      enable = true;
      interactiveShellInit = "
        set -g fish_term24bit 1
      ";
    };
    git = {
      enable = true;
      extraConfig = {
        user = {
          email = "vincent@woltmann.art";
          name = "Vincent Woltmann";
        };
        push = {
          default = "current";
          autoSetupRemote = true;
        };
        pull.rebase = true;
        init = {
          defaultBranch = "main";
        };
        "filter \"lfs\"" = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      mutableExtensionsDir = false;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        rust-lang.rust-analyzer
        ms-toolsai.jupyter
        mkhl.direnv
        ms-python.python
      ];
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
