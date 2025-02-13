require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.wo.relativenumber = true

vim.lsp.inlay_hint.enable(true)

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*Dockerfile*",
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})
