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
  use 'github/copilot.vim'
  use 'kdheepak/lazygit.nvim'
  use "ahrefs/vim-styled-ppx"
  use "lukas-reineke/indent-blankline.nvim"
  use "jwalton512/vim-blade"
  use 'folke/tokyonight.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'p00f/nvim-ts-rainbow'
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'andymass/vim-matchup'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'mattn/emmet-vim'
  use 'maxbrunsfeld/vim-yankstack'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'honza/vim-snippets'
  use 'SirVer/ultisnips'
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use 'sheerun/vim-polyglot'
  use 'terryma/vim-multiple-cursors'
  use 'nvim-lua/plenary.nvim'
  use 'reasonml-editor/vim-reason-plus'
  use 'jiangmiao/auto-pairs'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  use 'vijaymarupudi/nvim-fzf'
  use 'rescript-lang/vim-rescript'
  use 'nkrkv/nvim-treesitter-rescript'
end)
