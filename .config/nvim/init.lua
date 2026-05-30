local home = vim.fn.expand("~")

-- Appearance

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true -- show columns
vim.opt.showcmd = true
vim.opt.mouse = 'a'
vim.opt.belloff = 'all'
vim.opt.swapfile = false

vim.opt.list = true -- enable showing listchars
vim.opt.listchars = { tab = '>-', trail = '~' } -- show trailing whitespace and tabs


--- Search ---

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set('n', '<esc>', ':noh<return><esc>')
vim.keymap.set('v', '//', 'y/<C-R>"<CR>')


--- Coding ---

local set_tab_size = function(param)
  vim.opt.tabstop = param
  vim.opt.shiftwidth = param
  vim.opt.softtabstop = param
end

set_tab_size(2)
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cino = 'N-s' -- don't indent namespaces

vim.opt.wildmenu = true -- suggestion popup
vim.opt.wildmode = {'longest','list','full'}

-- permanent undo
vim.opt.undodir = home .. '/.vimdid'
vim.opt.undofile = true

-- copy to a system CLIPBOARD register (:help quoteplus)
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')

--- Go to definition / Go back ---
-- Call ctags -R . to generate

vim.keymap.set('n', '<A-]>', '<C-]>')
vim.keymap.set('n', '<A-[>', ':pop<CR>')

--- Basic file explorer ---
vim.keymap.set('n', '<leader>t', ':Oil<CR>')

--- Quickly go to prev/next buffer ---
vim.keymap.set('n', '<F2>', ':bprev<CR>')
vim.keymap.set('n', '<F3>', ':bnext<CR>')

--- Formatting (requires formatprg to be set up) ---
vim.keymap.set('v', '<leader>f', 'gq')
vim.keymap.set('n', '<leader>F', 'gggqG')

--- PLUGINS ---

local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('vim-scripts/a.vim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate', ['branch'] = 'main' })
Plug('nvim-lua/plenary.nvim')
Plug('rmehri01/onenord.nvim', { ['branch'] = 'main' })
Plug('sindrets/diffview.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = 'v0.2.2' })
Plug('nvim-telescope/telescope-fzf-native.nvim',
  { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' })

Plug('stevearc/oil.nvim')

vim.call('plug#end')

--- PLUGINS SETTINGS

-- Telescope
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<A-f>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<A-F>', ':Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<A-t>', ':Telescope tags<CR>')
vim.keymap.set('n', '<A-b>', ':Telescope buffers sort_mru=true ignore_current_buffer=true<CR> ')
vim.keymap.set('n', '<A-h>', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<A-m>', ':Telescope marks<CR>')
vim.keymap.set('n', '<A-R>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<A-r>', ':Telescope grep_string search=')
vim.keymap.set('v', '<A-r>', 'y:Telescope grep_string search=<C-R>"<CR>')


require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<C-f>'] = 'results_scrolling_down',
        ['<C-b>'] = 'results_scrolling_up',
        ['<Esc>'] = 'close',
      }
    },
    layout_strategy = 'bottom_pane',
    sorting_strategy = 'ascending',
    layout_config = {
      height = 0.8,
      width = 1.0,
    },
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
  }
}


-- Switch between .c/.h .cpp/.hpp
vim.keymap.set('n', '<A-s>', ':A<CR>')

-- Tree-Sitter (syntax highlighting)
local parsers = { 'cpp', 'c', 'rust', 'kotlin', 'python', 'markdown', 'lua' }
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function() pcall(vim.treesitter.start) end,
})

-- Oil (file explorer)
require("oil").setup({
  default_file_explorer = true,
  columns = {
    "size"
  },
  view_options = {
    show_hidden = true
  }
})

require('onenord').setup({
  disable = {
    background = true,
    float_background = true,
  }
})
