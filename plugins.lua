---@diagnostic disable: different-requires, redundant-return-value, deprecated
local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "nkrkv/nvim-treesitter-rescript",
    lazy = false,
  },
  -- Override plugin definition options
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "UIEnter",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "stevearc/conform.nvim",
        config = function()
          require "custom.configs.conform"
        end,
      },
      -- {
      --   "jay-babu/mason-null-ls.nvim",
      --   opts = {
      --     ensure_installed = {
      --       "solhint",
      --       "terraform_fmt",
      --     },
      --   },
      -- },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
    config = function()
      require "plugins.configs.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
      local wk = require "which-key"
      print "Hello world"
      -- local present, wk = pcall(require, "which-key")
      -- print(present)
      -- if not present then
      --   return
      -- end
      wk.register {
        -- add group
        ["<leader>"] = {
          f = { name = "+file" },
        },
      }
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
    dependencies = "neovim/nvim-lspconfig",
  }, -- add lsp plugin
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end,
  -- },
  "ray-x/go.nvim",
  "stevearc/conform.nvim", -- add lsp plugin
  -- "folke/neodev.nvim",

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    "zbirenbaum/copilot.lua",
    event = "UIEnter",
    dependencies = {
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function(_, _)
      local copilot_cmp = require "copilot_cmp"
      local opts = {
        formatters = {
          label = require("copilot_cmp.format").format_label_text,
          insert_text = require("copilot_cmp.format").format_insert_text,
          preview = require("copilot_cmp.format").deindent,
        },
      }
      copilot_cmp.setup(opts)
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    commit = "935b4069ce73b60ba9075bf05ee6ab50ed3af1a9",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      -- local function has_words_before()
      --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      -- end
      if not opts.mapping then
        opts.mapping = {}
      end
      opts.mapping["<Up>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
        else
          fallback()
        end
      end)
      opts.mapping["<Down>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
        else
          fallback()
        end
      end)
      opts.mapping["<C-Space>"] = cmp.mapping {
        i = cmp.mapping.complete(),
      }
      opts.mapping["<C-e>"] = cmp.mapping {
        i = function(fallback)
          if copilot.is_visible() then
            copilot.dismiss()
          elseif not cmp.abort() then
            fallback()
          end
        end,
        c = function(fallback)
          if copilot.is_visible() then
            copilot.dismiss()
          elseif not cmp.close() then
            fallback()
          end
        end,
      }
      opts.sources = {
        { name = "nvim_lsp", priority = 1000, group_index = 2 },
        { name = "copilot", priority = 950, group_index = 2 },
        { name = "luasnip", priority = 750, group_index = 2 },
        { name = "buffer", priority = 500, group_index = 2 },
        { name = "path", priority = 250, group_index = 2 },
      }

      return opts
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  {
    "nathom/filetype.nvim",
    config = function()
      require("filetype").setup {
        overrides = {
          extensions = {
            hcl = "terraform",
            tf = "terraform",
            tfvars = "terraform",
            tfstate = "json",
          },
        },
      }
    end,
  },
}

return plugins
