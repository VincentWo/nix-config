{
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
}
