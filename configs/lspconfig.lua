local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "marksman",
  "ts_ls",
  "terraformls",
  "gopls",
  "prismals",
  "v_analyzer",
  "grammarly",
  -- "denols",
  -- "rust_analyzer",
  "solidity_ls_nomicfoundation",
  "svelte",
  "graphql",
  "gleam",
  -- "elixirls",
}
--
-- lspconfig.elixirls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "/opt/homebrew/bin/elixir-ls" },
-- }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
