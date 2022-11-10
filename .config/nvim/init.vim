call plug#begin()
  Plug 'OldWorldOrdr/nvim-base16'
  Plug 'goolord/alpha-nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'dense-analysis/ale'
  Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'github/copilot.vim'
  Plug 'ap/vim-css-color'
  Plug 'jiangmiao/auto-pairs'
  Plug 'jghauser/mkdir.nvim'
  Plug 'kdheepak/lazygit.nvim'
call plug#end()

set noshowmode
set termguicolors
colorscheme base16-classic-dark
set number
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2
set mouse=a
set dir=~/.cache/vim
set history=1000
set clipboard=unnamedplus
set guifont=CaskaydiaCove\ Nerd\ Font\ Mono
let g:neovide_refresh_rate = 144
let g:neovide_refresh_rate_idle = 5

let g:ale_sign_error = ' x'
let g:ale_sign_warning = ' !'

lua require('init')

nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <C-o> :ToggleTerm<CR>
nnoremap <silent> <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent> <A-.> :BufferLineCycleNext<CR>
nnoremap <silent> <C-g> :LazyGit<CR>
nnoremap d "_d
vnoremap d "_d
