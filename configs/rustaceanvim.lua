local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local inlay_hints = require("lsp-inlayhints")

local options = {
  server = {
    on_attach = function(client, buffer)
      inlay_hints.on_attach(client, buffer)
      on_attach(client, buffer)
    end,
    capabilities = capabilities,
    settings = function(project_root)
      local ra = require('rustaceanvim.config.server')
      return ra.load_rust_analyzer_settings(project_root, {
        settings_file_pattern = 'rust-analyzer.json'
      })
    end,
  },
  auto_focus = true,
}

return options
