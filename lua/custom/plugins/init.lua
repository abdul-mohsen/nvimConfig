-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  "windwp/nvim-autopairs",
  -- Optional dependency
  config = function()
    require("nvim-autopairs").setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,

 "mfussenegger/nvim-dap",
 "rcarriga/nvim-dap-ui",
  dependencies = { 'hrsh7th/nvim-cmp', 'mfussenegger/nvim-dap'  },
}
