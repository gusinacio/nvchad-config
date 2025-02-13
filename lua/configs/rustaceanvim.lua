local options = {
  tools = {
    enable_clippy = false,
  },
  server = {
    default_settings = {
      ["rust-analyzer"] = {
        inlayHints = {
          maxLength = 10,
          -- maxLength = 100,
          closingBraceHints = {
            enable = false,
          },
          closureReturnTypeHints = {
            enable = true,
          },
          discriminantHints = {
            enable = true,
          },
        },
      },
    },
  },
  auto_focus = true,
}

return options
