call plug#begin()
    Plug 'ryanoasis/vim-devicons'
    Plug 'ayu-theme/ayu-vim'
    Plug 'goolord/alpha-nvim'
    Plug 'ms-jpq/chadtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dense-analysis/ale'
call plug#end()

let g:airline_theme='atomic'
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

lua << EOF
 require'alpha'.setup(require'alpha.themes.dashboard'.config)
EOF
