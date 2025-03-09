-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("set clipboard+=unnamedplus")

if os.execute("command -v xclip") == 0 then
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "timeout 0.5 xclip -i -selection clipboard",
      ["*"] = "timeout 0.5 xclip -i -selection primary",
    },
    paste = {
      ["+"] = "timeout 0.5 xclip -o -selection clipboard",
      ["*"] = "timeout 0.5 xclip -o -selection primary",
    },
    cache_enabled = 1,
  }
end

vim.g.lazyvim_picker = "snacks"

vim.g.autoformat = false

local function set_neovide_options()
  if not vim.g.neovide then
    return
  end
  vim.o.guifont = "RecMonoChielo Nerd Font Mono,Noto Sans Mono CJK SC:h11"

  vim.o.linespace = 0
  vim.g.neovide_scale_factor = 1.0

  vim.g.neovide_padding_top = 4
  vim.g.neovide_padding_bottom = 4
  vim.g.neovide_padding_right = 4
  vim.g.neovide_padding_left = 4

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  vim.g.neovide_transparency = 0.95

  vim.g.neovide_scroll_animation_length = 0.1

  vim.g.neovide_theme = "auto"

  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 12

  vim.g.neovide_remember_window_size = true

  vim.g.neovide_input_ime = true

  vim.g.neovide_cursor_animation_length = 0.06
  vim.g.neovide_cursor_trail_size = 0.7
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

set_neovide_options()

return {
  set_neovide_options = set_neovide_options,
}
