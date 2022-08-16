call plug#begin()
    Plug 'ayu-theme/ayu-vim'
    Plug 'goolord/alpha-nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'ayu-theme/ayu-vim-airline'
    Plug 'dense-analysis/ale'
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

let g:airline_theme='ayu'
set termguicolors
let ayucolor="dark"
colorscheme ayu
set number
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set mouse=a
set dir=~/.cache/vim
set history=1000
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['Lines: %L'])

lua << EOF
    require'alpha'.setup(require'alpha.themes.dashboard'.config)
    require("toggleterm").setup{}
    require("nvim-tree").setup()
    require("bufferline").setup{
    options = {
        separator_style = "slant",
        },
    }
EOF

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-o> :ToggleTerm<CR>
nnoremap <silent>    <A-,> <Cmd>BufferLineCyclePrev<CR>
nnoremap <silent>    <A-.> <Cmd>BufferLineCycleNext<CR>
