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
vim.keymap.set('n', '<leader>t', ':Explore<CR>')
vim.keymap.set('n', '<leader>T', ':Explore .<CR>')

--- Quickly go to prev/next buffer ---
vim.keymap.set('n', '<F2>', ':bprev<CR>')
vim.keymap.set('n', '<F3>', ':bnext<CR>')

--- PLUGINS ---

local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('vim-scripts/a.vim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate', ['branch'] = 'master' })
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('nvim-telescope/telescope-fzf-native.nvim',
  { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' })

vim.call('plug#end')

--- PLUGINS SETTINGS

-- Telescope
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<A-f>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<A-F>', ':Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<A-t>', ':Telescope tags<CR>')
vim.keymap.set('n', '<A-b>', ':Telescope buffers<CR>')
vim.keymap.set('n', '<A-h>', ':Telescope help_tags<CR>')
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
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  }
}

vim.cmd('colorscheme slate')
vim.cmd('hi MatchParen guibg=bg guifg=SlateBlue')
vim.cmd('hi ModeMsg guibg=bg guifg=fg')
vim.cmd('hi Visual guibg=#1e5b47')
