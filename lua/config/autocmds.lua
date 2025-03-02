-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- sync with system clipboard on focus changes
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  command = [[call setreg("@", getreg("+"))]],
})
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  command = [[call setreg("+", getreg("@"))]],
})

local function disable_large_json_syntax()
  if vim.bo.filetype ~= "json" then
    return
  end

  local size = vim.fn.wordcount().bytes
  if size <= 8192 then
    return
  end

  require("lazy").load({
    wait = true,
    plugins = { "nvim-treesitter" },
  })

  vim.cmd("TSBufDisable highlight")
  vim.bo.syntax = "off"
  vim.cmd("NoMatchParen")
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
  pattern = { "*.json" },
  callback = disable_large_json_syntax,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json" },
  callback = disable_large_json_syntax,
})
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  pattern = { "*" },
  callback = disable_large_json_syntax,
})
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "VeryLazy" },
  callback = disable_large_json_syntax,
})

vim.api.nvim_create_autocmd({ "ChanOpen", "ChanInfo" }, {
  callback = require("config.options").set_neovide_options,
})
