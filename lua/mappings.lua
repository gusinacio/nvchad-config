require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local mappings = {
  n = {
    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
    },
    ["<F5>"] = {
      function()
        -- (Re-)reads launch.json if present
        if vim.fn.filereadable ".nvim/launch.json" then
          require("dap.ext.vscode").load_launchjs(".nvim/launch.json", { lldb = { "rust" } })
        end
        require("dap").continue()
      end,
      "DAP Continue",
    },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" },
    ["<leader>dt"] = {
      function()
        local dapui = require "dapui"
        dapui.toggle()
      end,
      "Open debugging sidebar",
    },

    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
    ["gt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto type definition" },
    ["|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
    ["\\"] = { "<cmd>split<cr>", "Horizontal Split" },
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
        require("nvchad.tabufline").closeAllBufs(false)
      end,
      "Close other buffers",
    },
    -- ["<S-tab>"] = { "" },
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
    -- ["<leader>e"] = { "<cmd> Oil <CR>", "Toggle oil" },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code action",
    },
    ["<leader>lf"] = {
      function()
        require("conform").format()
        -- vim.lsp.buf.format { async = true }
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
        require "nvchad.lsp.renamer"()
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

map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>")
map("n", "<leader>fr", require("telescope.builtin").resume)

map("v", ">", ">gv")
map("v", "<", "<gv")

-- really important, don't mess with my clipboard while pasting things
local function visual_paste_without_yank()
  local register = "+"

  if vim.o.clipboard == "unnamed" then
    register = "*"
  end

  vim.fn.setreg("x", vim.fn.getreg(register))
  vim.api.nvim_paste(vim.fn.getreg(register), false, -1)
  vim.fn.setreg(register, vim.fn.getreg "x")
end
vim.keymap.set("v", "p", visual_paste_without_yank, { noremap = true, silent = true })
vim.keymap.set("v", "P", visual_paste_without_yank, { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- more keybinds!
for mode, maps in pairs(mappings) do
  for key, val in pairs(maps) do
    map(mode, key, val[1], { desc = val[2] })
  end
end
