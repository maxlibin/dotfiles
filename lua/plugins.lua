-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use "kdheepak/lazygit.nvim"
  use "ahrefs/vim-styled-ppx"
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
  use "lukas-reineke/indent-blankline.nvim"
  use "jwalton512/vim-blade"
  use 'p00f/nvim-ts-rainbow'
  use 'nkrkv/nvim-treesitter-rescript'
  use 'rescript-lang/vim-rescript'
  use 'nvim-telescope/telescope.nvim'
  use 'andymass/vim-matchup'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'mattn/emmet-vim'
  use 'airblade/vim-gitgutter'
  use 'maxbrunsfeld/vim-yankstack'
  use 'tpope/vim-fugitive'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tomlion/vim-solidity'
  use 'honza/vim-snippets'
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf.vim'
  use 'sheerun/vim-polyglot'
  use 'terryma/vim-multiple-cursors'
  use 'nvim-lua/plenary.nvim'
  use 'reasonml-editor/vim-reason-plus'
  use 'jiangmiao/auto-pairs'
  use "numToStr/FTerm.nvim"
  use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
  use {'folke/tokyonight.nvim', branch = 'main' }
  use 'vijaymarupudi/nvim-fzf'
end)
