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

set.listchars:append("space:⋅")
set.listchars:append("eol:↴")

vim.api.nvim_set_hl(0, 'LineNr', { fg = "#ffffff"} )

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
  extensions = { 'fugitive', 'toggleterm' }
}

require("bufferline").setup{}
