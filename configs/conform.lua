local conform = require "conform"

local sources = {
  rust = { "rustfmt" },
  lua = { "stylua" },
  terraform = { "terraform_fmt" },
  hcl = { "terragrunt_hcl" },
  go = { "goimports", "gofmt" },
  javascript = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  typescript = { "prettier" },
  toml = { "taplo" },
}

conform.formatters.terragrunt_hcl = {
  command = "terragrunt",
  args = { "hclfmt", "-terragrunt-hclfmt-file", "$FILENAME" },
  stdin = false,
}

conform.setup {
  formatters_by_ft = sources,
}
