local M = {}

M = {
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

    "marksman",
    "ltex-ls",
  },
}

return M
