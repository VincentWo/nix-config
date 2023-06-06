{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
  };

  programs = {
    bash.enable = true;
    helix = import ./helix.nix;
    vscode = import ./vscode.nix { pkgs = pkgs; };
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
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
