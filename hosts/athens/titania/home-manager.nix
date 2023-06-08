{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    file = {
      # Controls the preferred encoding + locale for CoreFoundation
      # 0x08000100 = UTF-8
      # 0 = English
      ".CFUserTextEncoding".text = "0x08000100:0";
    };
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
    git = import ./git.nix;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
