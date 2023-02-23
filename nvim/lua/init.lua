local set = vim.opt

set.tabstop=2
set.shiftwidth=2
set.softtabstop=2
set.number=true
set.relativenumber=true
set.expandtab=true
set.smartindent=true
set.cmdheight=0
set.colorcolumn="120"
set.list=true
set.cursorline=true
set.cursorcolumn=true
set.undofile=true
set.termguicolors=true
set.wrap=false
set.ignorecase=true
set.swapfile=false
set.mouse=""

set.listchars:append("space:⋅")
set.listchars:append("eol:↴")

vim.api.nvim_set_hl(0, 'LineNr', { fg = "#ffffff"} )

vim.g.matchup_matchparen_offscreen = { method = "popup" }
vim.g.UltiSnipsExpandTrigger = "<C-t>"
vim.g.UltiSnipsEditSplit="vertical"

require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

require("mason").setup()

require('lualine').setup {
  options = {
    theme = 'tokyonight'
  },
  extensions = { 'fugitive', 'toggleterm' },
  sections = {
    lualine_a =
    {
      {
        'mode',
        icons_enabled = true, -- Enables the display of icons alongside the component.
        icon = "",
      }
    },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_b= {
      {
        'filename',
        file_status = true,      -- Displays file status (readonly status, modified status)
        newfile_status = false,  -- Display new file status (new file means no write after created)
        path = 1,                -- 0: Just the filename
                                 -- 1: Relative path
                                 -- 2: Absolute path
                                 -- 3: Absolute path, with tilde as the home directory

        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                 -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified.
          readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]',     -- Text to show for newly created file before first write
        }
      }
    }
  }
}

require("bufferline").setup{
  options = {
    separator_style = {"", ""},
  }
}

require('nvim-autopairs').setup{}

require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}
