local set = vim.opt

set.guifont="Fira Code:h12"
set.tabstop=2
set.shiftwidth=2
set.softtabstop=2
set.number=true
set.relativenumber=true
set.expandtab=true
set.smartindent=true
set.wrap=false
set.swapfile=false
set.backup=false
set.incsearch=true
set.cursorline=true
set.cursorcolumn=true
set.ignorecase=true
set.lazyredraw=true
set.ttyfast=true
set.colorcolumn="120"
set.signcolumn="auto"
set.mouse="c"
set.cmdheight=2
set.updatetime=300
set.writebackup=false
set.hidden=true
set.linespace=1

set.list=true
set.listchars:append("space:⋅")
set.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require'nvim-treesitter.configs'.setup {
  highlight = {
   enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require("tokyonight").setup({
  on_highlights = function(hl, c)
    hl.TelescopeNormal = {
      bg = c.transparent,
      fg = c.transparent,
    }
    hl.TelescopeBorder = {
      bg = c.transparent,
      fg = c.transparent,
    }
    hl.TelescopePromptNormal = {
      bg = c.transparent,
    }
    hl.TelescopePromptBorder = {
      bg = c.transparent,
      fg = c.transparent,
    }
    hl.TelescopePromptTitle = {
      bg = c.transparent,
      fg = c.transparent,
    }
    hl.TelescopePreviewTitle = {
      bg = c.transparent,
      fg = c.transparent,
    }
    hl.TelescopeResultsTitle = {
      bg = c.transparent,
      fg = c.transparent,
    }
  end,
})

require('telescope').setup{
  defaults = {
  },
  pickers = {
    live_grep = {
      theme = "dropdown",
    },
    find_files = {
    }
  },
  extensions = {
    -- ...
  }
}

-- Example keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-g>', builtin.find_files, {})
vim.keymap.set("n", '<C-f>', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

require("toggleterm").setup{
  open_mapping = [[<c-z>]],
  float_opts = {
    border= 'curved'
  },
  direction = 'float'
}
