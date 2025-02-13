local M = {}

M = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "rust",
    "go",
    "terraform",
    "hcl",
    "prisma",
    "svelte",
    "v",
    "gleam",
    "elixir",
    "dockerfile",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

return M
