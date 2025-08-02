-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'windwp/nvim-autopairs',
  -- Optional dependency
  config = function()
    require('nvim-autopairs').setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
  'nvim-neotest/nvim-nio',
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-completion',
  'kristijanhusak/vim-dadbod-ui',
  'pbogut/vim-dadbod-ssh',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- dependencies = { 'hrsh7th/nvim-cmp', 'mfussenegger/nvim-dap', "nvim-neotest/nvim-nio" },
}
