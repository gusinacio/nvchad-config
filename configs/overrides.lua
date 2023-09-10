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
    "go"
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
    "deno",
    "prettier",

    -- c/cpp stuff
    "rust-analyzer",
    "gopls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    side = "right",
  },
  -- git = {
  --   enable = true,
  -- },
  --
  -- renderer = {
  --   highlight_git = true,
  --   icons = {
  --     show = {
  --       git = true,
  --     },
  --   },
  -- },
}

return M
