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

lua << EOF
  require'alpha'.setup(require'alpha.themes.dashboard'.config)
  require("toggleterm").setup{}
  require("nvim-tree").setup()
  require("bufferline").setup{
    options = {
      separator_style = "slant",
    },
  }

  local colors = {
    red = '#ca1243',
    grey = '#a0a1a7',
    black = '#383a42',
    white = '#f3f3f3',
    background = '#0f1419',
    light_green = '#83a598',
    orange = '#fe8019',
    green = '#8ec07c',
  }

  local theme = {
    normal = {
      a = { fg = colors.background, bg = colors.black },
      b = { fg = colors.background, bg = colors.grey },
      c = { fg = colors.black, bg = colors.background },
      z = { fg = colors.background, bg = colors.black },
    },
    insert = { a = { fg = colors.black, bg = colors.light_green } },
    visual = { a = { fg = colors.black, bg = colors.orange } },
    replace = { a = { fg = colors.black, bg = colors.green } },
  }

  local empty = require('lualine.component'):extend()
  function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
  end

  local function process_sections(sections)
    for name, section in pairs(sections) do
      local left = name:sub(9, 10) < 'x'
      for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
        table.insert(section, pos * 2, { empty, color = { fg = colors.background, bg = colors.background } })
      end
      for id, comp in ipairs(section) do
        if type(comp) ~= 'table' then
          comp = { comp }
          section[id] = comp
        end
        comp.separator = left and { right = '' } or { left = '' }
      end
    end
    return sections
  end

  local function search_result()
    if vim.v.hlsearch == 0 then
      return ''
    end
    local last_search = vim.fn.getreg('/')
    if not last_search or last_search == '' then
      return ''
    end
    local searchcount = vim.fn.searchcount { maxcount = 9999 }
    return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
  end

  local function modified()
    if vim.bo.modified then
      return '+'
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
      return '-'
    end
    return ''
  end

  require('lualine').setup {
    options = {
      theme = "codedark",
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = process_sections {
      lualine_a = { 'mode' },
      lualine_b = {
        'branch',
        'diff',
        {
          'diagnostics',
          source = { 'nvim' },
          sections = { 'error' },
          diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
        },
        {
          'diagnostics',
          source = { 'nvim' },
          sections = { 'warn' },
          diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
        },
        { 'filename', file_status = false, path = 1 },
        { modified },
        {
          '%w',
          cond = function()
            return vim.wo.previewwindow
          end,
        },
        {
          '%r',
          cond = function()
            return vim.bo.readonly
          end,
        },
        {
          '%q',
          cond = function()
            return vim.bo.buftype == 'quickfix'
          end,
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { search_result, 'filetype' },
      lualine_z = { '%l:%c', '%p%%/%L' },
    },
    inactive_sections = {
      lualine_c = { '%f %y %m' },
      lualine_x = {},
    },
  }

  local Terminal  = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

  function _lazygit_toggle()
    lazygit:toggle()
  end
EOF

nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <C-o> :ToggleTerm<CR>
nnoremap <silent> <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent> <A-.> :BufferLineCycleNext<CR>
nnoremap <silent> <C-g> :lua _lazygit_toggle()<CR>
