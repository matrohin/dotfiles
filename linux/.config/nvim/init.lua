vim.cmd('source ~/.config/nvim/old_init.vim')
require('private.init')
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
require('nvim-treesitter.configs').setup({
  ensure_installed = { "cpp" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
