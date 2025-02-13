-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE

local servers = {
  "html",
  "cssls",
  "marksman",
  "ts_ls",
  "terraformls",
  "gopls",
  "prismals",
  "v_analyzer",
  -- "grammarly",
  -- "denols",
  -- "rust_analyzer",
  "solidity_ls_nomicfoundation",
  "svelte",
  "graphql",
  "gleam",
  -- "elixirls",
}
--

local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.elixirls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = { "/opt/homebrew/bin/elixir-ls" },
}

-- lspconfig.ltex.setup {
--   on_attach = function(_, bufnr)
--     require("ltex-utils").on_attach(bufnr)
--   end,
--   capabilities = nvlsp.capabilities,
--   use_spellfile = false,
--   filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text", "rust" },
--   settings = {
--     ltex = {
--       enabled = { "latex", "tex", "bib", "markdown", "rust" },
--       language = "auto",
--       diagnosticSeverity = "information",
--       sentenceCacheSize = 2000,
--       additionalRules = {
--         enablePickyRules = true,
--         motherTongue = "en",
--       },
--       dictionary = (function()
--         local files = {}
--         for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
--           local lang = vim.fn.fnamemodify(file, ":t:r")
--           local fullpath = vim.fs.normalize(file, ":p")
--           files[lang] = { ":" .. fullpath }
--         end
--
--         if files.default then
--           for lang, _ in pairs(files) do
--             if lang ~= "default" then
--               vim.list_extend(files[lang], files.default)
--             end
--           end
--           files.default = nil
--         end
--         return files
--       end)(),
--     },
--   },
-- }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
