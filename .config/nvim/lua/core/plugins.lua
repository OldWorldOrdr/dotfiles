local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'github/copilot.vim'
  use 'dense-analysis/ale'
  use 'ap/vim-css-color'
  use 'jiangmiao/auto-pairs'
  use 'akinsho/bufferline.nvim'
  use 'wbthomason/packer.nvim'
  use 'OldWorldOrdr/nvim-base16'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
