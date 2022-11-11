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

require'FTerm'.setup({
    dimensions  = {
      height = 0.8,
      width = 0.9,
      blend = 80,
    },
})

-- Example keybindings
vim.keymap.set("n", '<C-f>', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<C-z>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-z>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.g.copilot_node_command = "~/.nvm/versions/node/v16.13.1/bin/node"
