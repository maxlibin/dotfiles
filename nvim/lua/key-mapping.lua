local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-g>', builtin.find_files, {})
vim.keymap.set("n", '<C-f>', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<Space>e', ':CocCommand explorer<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kk', '<Esc>')

vim.keymap.set('n', '<C-k>', ':bn<CR>')
vim.keymap.set('n', '<C-j>', ':bp<CR>')

require("toggleterm").setup{
  open_mapping = [[<c-z>]],
  float_opts = {
    border= 'curved'
  },
  direction = 'float'
}
