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
  },
  auto_focus = true,
}

return options
