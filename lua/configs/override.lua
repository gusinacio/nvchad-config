local M = {}

M.treesitter = {
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
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "svelte-language-server",
    "prisma-language-server",
    "deno",
    "prettier",

    "rust-analyzer",
    "gopls",
    "terraform-ls",
    "elixir-ls",
    "taplo",
    "codelldb",

    "ltex-ls",
    "marksman",
  },
}

return M
