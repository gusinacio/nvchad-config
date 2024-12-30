local conform = require "conform"

local sources = {
  rust = { "rustfmt" },
  gleam = { "gleam" },
  lua = { "stylua" },
  terraform = { "terraform_fmt" },
  hcl = { "terragrunt_hcl" },
  go = { "goimports", "gofmt" },
  javascript = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  typescript = { "prettier" },
  toml = { "taplo" },
  v = { "vfmt" },
}

conform.formatters.vfmt = {
  command = "v",
  args = { "fmt" },
}

conform.formatters.terragrunt_hcl = {
  command = "terragrunt",
  args = { "hclfmt", "-terragrunt-hclfmt-file", "$FILENAME" },
  stdin = false,
}

conform.setup {
  formatters_by_ft = sources,
}
