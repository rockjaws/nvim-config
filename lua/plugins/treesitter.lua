return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  opts = {
    -- Declarative list: Checks if they exist before building
    ensure_installed = { 
      'typescript', 'javascript', 'c_sharp', 'lua', 'tsx', 'vim', 'vimdoc', 'query' 
    },
    highlight = { enable = true }, -- Required in the new version
  },
  config = function(_, opts)
    -- Use the top-level setup, NOT the .configs sub-module
    require('nvim-treesitter').setup(opts)
  end,
}
