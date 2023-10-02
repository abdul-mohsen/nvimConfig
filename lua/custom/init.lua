vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>B", vim.cmd.make)
local dap = require('dap')
dap.adapters.cppdbg = {
  id = '',
  type = 'executable',
	command = '~/download/extension/lldb/bin/lldb',
}
vim.keymap.set('n', '<leader>b', "require('dap').toggle_breakpoint()<CR>")
