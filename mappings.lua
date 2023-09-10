---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>x"] = { "" },
    ["<leader>ca"] = { "" },
    ["<leader>cm"] = { "" },
    ["<leader>cc"] = { "" },
    ["<leader>ch"] = { "" },
    ["<leader>q"] = { "" },
    ["<leader>D"] = { "" },
    ["<leader>/"] = { "" },
    ["<leader>b"] = { "" },
    ["<leader>n"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>bc"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs()
      end,
      "Close other buffers",
    },
    ["<S-tab>"] = { "" },
    ["]b"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["[b"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-s>"] = {
      "<cmd>w<cr><esc>",
      "Save file",
    },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code action",
    },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "Format file",
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Line Diagnostic",
    },
    ["<leader>lD"] = {
      function()
        require("telescope.builtin").diagnostics()
      end,
      "Search diagnostics",
    },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "Rename symbol",
    },

    ["<leader>o"] = {
      'o<Esc>0"_D',
      "New line below",
    },
    ["<leader>O"] = {
      'O<Esc>0"_D',
      "New line above",
    },
    ["<leader>sl"] = {
      '<cmd>lua require("persistence").load()<cr>',
      "Last session",
    },
  },
  i = {
    ["<C-s>"] = {
      "<cmd>w<cr><esc>",
      "Save file",
    },
  },
  v = {
    ["<C-s>"] = {
      "<cmd>w<cr><esc>",
      "Save file",
    },
  },
}

-- more keybinds!

return M
