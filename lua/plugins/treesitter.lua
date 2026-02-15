return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  init = function()
    vim.env.CC = 'gcc'
  end,
  opts = {
    ensure_installed = { 
      'typescript', 'javascript', 'c_sharp', 'zig', 'lua', 'tsx', 'vim', 'vimdoc', 'query' 
    },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)
  end,
}
