vim.opt.nu = true
vim.cmd "set noshowmode"

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })

vim.opt.guifont = "CaskaydiaCove Nerd Font Mono"
vim.g.neovide_refresh_rate = 144
vim.o.termguicolors = true
vim.cmd "colorscheme base16-classic-dark"
