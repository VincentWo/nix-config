{
  enable = true;
  settings = {
    theme = "solarized_light";
    editor = {
      indent-guides.render = true;
      cursorline = false;

      lsp = {
        display-messages = true;
        display-inlay-hints = true;
      };
    };
  };
  languages = {
    language = [
      {
        name = "rust";
        language-server = {
          name = "rust-analyzer";
          command = "rust-analyzer";
          config = {
            assist.emitMusUse = true;
            check.command = "clippy";
            diagnostics.experimental.enable = true;
            completion.privateEditable.enable = true;
            imports.granularity.enforce = true;
            procMacro.ignored.tracing = ["instrument"];
            references.excludeImports = true;
            typing.autoClosingAngleBrackets.enable = true;

            inlayHints = {
              bindingModeHints.enable = true;
              closureCaptureHints.enable = true;
              closureReturnTypeHints.enable = "always";
              discriminatHints.enable = "always";
              expressionAdjustmentHints = {
                enable = "always";
                mode = "postfix";
              };
              lifetimElisionHints = {
                enable = "always";
                useParameterNames = true;
              };
              maxLength = 25;
            };
          };
        };
      }
      {
        name = "python";
        language-server.command = "pyls";
      }
      {
        name = "unicode_math";
        language-server.command = "/Users/titania/programming/um/target/release/unicode_lsp";
        scope = "text.unicode_math";
        file-types = [
          "um"
          "uni_math"
        ];
        roots = [];
      }
    ];
  };
}
