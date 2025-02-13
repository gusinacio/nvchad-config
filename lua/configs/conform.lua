local sources = {
  rust = { "rustfmt" },
  gleam = { "gleam" },
  lua = { "stylua" },
  terraform = { "terraform_fmt" },
  hcl = { "terragrunt_hcl" },
  go = { "goimports", "gofmt" },
  javascript = { "prettier" },
  markdown = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  typescript = { "prettier" },
  toml = { "taplo" },
  v = { "vfmt" },
}

local util = require "conform.util"
local prettier = require "conform.formatters.prettier"
util.add_formatter_args(prettier, { "--prose-wrap", "always", "--print-width", "80" })

local options = {
  formatters_by_ft = sources,
  formatters = {
    taplo = {
      args = { "format", "--option", "indent_string=    ", "-" },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

-- options.formatters.vfmt = {
--   command = "v",
--   args = { "fmt" },
-- }
--
-- options.formatters.terragrunt_hcl = {
--   command = "terragrunt",
--   args = { "hclfmt", "-terragrunt-hclfmt-file", "$FILENAME" },
--   stdin = false,
-- }

return options
