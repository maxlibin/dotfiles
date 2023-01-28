return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'folke/tokyonight.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'nvim-tree/nvim-web-devicons'
  use 'williamboman/mason.nvim'
  use 'tpope/vim-surround'
  use 'airblade/vim-gitgutter'
  use 'rescript-lang/vim-rescript'
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  use {'neoclide/coc.nvim', branch='release' }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use {'akinsho/toggleterm.nvim', tag = '*', config = function()
      require("toggleterm").setup()
    end
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
end)
