local OllamaState = {
  ANTICIPATING_REASONING = 1,
  REASONING = 2,
  ANTICIPATING_OUTPUTTING = 3,
  OUTPUTTING = 4,
}
---@type integer
local _ollama_state

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    opts = function()
      return require "configs.rustaceanvim"
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
  },

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
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }
      opts.mapping["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }
    end,
  },
  {
    "jhofscheier/ltex-utils.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      -- "nvim-telescope/telescope-fzf-native.nvim", -- optional
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- adapters = {
      --   ollama = function()
      --     local ollama = require "codecompanion.adapters.ollama"
      --
      --     return require("codecompanion.adapters").extend("ollama", {
      --       env = {
      --         url = "http://localhost:11434",
      --       },
      --       headers = {
      --         ["Content-Type"] = "application/json",
      --       },
      --       parameters = {
      --         sync = true,
      --       },
      --       schema = {
      --         model = {
      --           default = "deepseek-r1",
      --         },
      --       },
      --       ---Check for a token before starting the request
      --       ---@param self CodeCompanion.Adapter
      --       ---@return boolean
      --       setup = function(self)
      --         _ollama_state = OllamaState.ANTICIPATING_OUTPUTTING
      --         return true
      --       end,
      --       handlers = {
      --         chat_output = function(self, data)
      --           local inner = ollama.handlers.chat_output(self, data)
      --
      --           if inner == nil then
      --             return inner
      --           end
      --
      --           if inner.status ~= "success" or inner.output == nil or type(inner.output.content) ~= "string" then
      --             return inner
      --           end
      --
      --           if string.find(inner.output.content, "<think>") ~= nil then
      --             _ollama_state = OllamaState.ANTICIPATING_REASONING
      --             inner.output.content = inner.output.content:gsub("%s*<think>%s*", "")
      --           elseif string.find(inner.output.content, "</think>") ~= nil then
      --             _ollama_state = OllamaState.ANTICIPATING_OUTPUTTING
      --             inner.output.content = inner.output.content:gsub("%s*</think>%s*", "")
      --           elseif inner.output.content:match "^%s*$" ~= nil then
      --             inner.output.content = ""
      --           elseif _ollama_state == OllamaState.ANTICIPATING_OUTPUTTING then
      --             _ollama_state = OllamaState.OUTPUTTING
      --           elseif _ollama_state == OllamaState.ANTICIPATING_REASONING then
      --             _ollama_state = OllamaState.REASONING
      --           end
      --
      --           if _ollama_state == OllamaState.ANTICIPATING_REASONING or _ollama_state == OllamaState.REASONING then
      --             inner.output.reasoning = inner.output.content
      --             inner.output.content = nil
      --           end
      --
      --           return inner
      --         end,
      --       },
      --     })
      --   end,
      -- },
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },
    },

    -- config = function()
    --   require("codecompanion").setup {
    --     adapters = {
    --       ollama = function()
    --         return require("codecompanion.adapters").extend("openai_compatible", {
    --           env = {
    --             url = "http[s]://open_compatible_ai_url", -- optional: default value is ollama url http://127.0.0.1:11434
    --             api_key = "OpenAI_API_KEY", -- optional: if your endpoint is authenticated
    --             chat_url = "/v1/chat/completions", -- optional: default value, override if different
    --           },
    --         })
    --       end,
    --     },
    --   }
    -- end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
