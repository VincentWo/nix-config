{ pkgs, ... }:
{
  services.nix-daemon.enable = true;
  programs = {
    bash.enable = false;
    fish.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      # Better find
      fd
      # Better grep
      ripgrep
      # Better ls
      exa
      # Better ssh
      eternal-terminal
      # my editor
      helix
      # I need nightly etc. so just get rustup
      rustup
      # Nix language server to improve editing the config
      nil
      # Just usefull.
      python3
    ];
    shells = [
      pkgs.fish
    ];
    loginShell = pkgs.fish;
    variables = {
      EDITOR = "hx";
      # Since somebody thought adding telemetry to a terminal would be a good idea...
      ET_NO_TELEMETR = "1";
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
    };
  };
  

  homebrew = {
    enable = true;
    casks = [
      "visual-studio-code"
      # Matrix 
      "element"
    ];
  };

  users.users.titania = {
    name = "titania";
    home = "/Users/titania";
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.titania = import ./titania/home-manager.nix;
  };
}
