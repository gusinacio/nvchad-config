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
    "rescriptls",

    "rust-analyzer",
    "gopls",
    "terraform-ls",
    "taplo",
    "codelldb",
  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    side = "right",
  },

  git = {
    enable = true,
  },
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
