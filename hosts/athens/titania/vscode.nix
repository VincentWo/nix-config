{ pkgs }: {
  enable = true;
  package = pkgs.vscodium;
  enableExtensionUpdateCheck = false;
  enableUpdateCheck = false;
  mutableExtensionsDir = false;
  userSettings = {
    # Just open untrustedFiles in a trusted Workspace
    security.workspace.trust.untrustedFiles = "open";
    # Restart on env change, to directly reflect new dependencies
    direnv.restart.automatic = true;
    # TODO: Fill concrete path of direnv executable
    direnv.path.executable = pkgs.direnv + /bin/direnv;
    jupyter = {
      themeMatplotlibPlots = true;
      enableExtendedKernelCompletions = true;
      kernels.filter = [
          {
            path = "/run/current-system/sw/bin/python";
            type = "pythonEnvironment";
          }
          {
            path = "/usr/bin/python3";
            type = "pythonEnvironment";
          }
      ];
    };
  };
  extensions = with pkgs.vscode-extensions; with pkgs.all-vscode-extensions; [
    vscodevim.vim
    rust-lang.rust-analyzer
    ms-toolsai.jupyter
    mkhl.direnv
    ms-python.python
    vscode-marketplace.banacorn.agda-mode
  ];
}