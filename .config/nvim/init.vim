call plug#begin()
    Plug 'ayu-theme/ayu-vim'
    Plug 'goolord/alpha-nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'ayu-theme/ayu-vim-airline'
    Plug 'dense-analysis/ale'
    Plug 'ms-jpq/chadtree'
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
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
EOF

nnoremap <C-n> :CHADopen<CR>
nnoremap <C-o> :ToggleTerm<CR>
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
