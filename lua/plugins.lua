-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'dense-analysis/ale'
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'p00f/nvim-ts-rainbow'
  use {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    run = 'cd app && yarn install'
  }
  use 'nkrkv/nvim-treesitter-rescript'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'andymass/vim-matchup'
  use 'mattn/emmet-vim'
  use 'airblade/vim-gitgutter'
  use 'maxbrunsfeld/vim-yankstack'
  use 'tpope/vim-fugitive'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'jiangmiao/auto-pairs'
  use 'tomlion/vim-solidity'
  use 'honza/vim-snippets'
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf.vim'
  use 'sheerun/vim-polyglot'
  use 'terryma/vim-multiple-cursors'
  use 'rescript-lang/vim-rescript'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
end)
