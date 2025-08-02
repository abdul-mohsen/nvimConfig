vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>B', vim.cmd.make)

local dap = require 'dap'
local dapui = require 'dapui'
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/ssda/download/extension/adapter/codelldb',
    args = { '--port', '${port}' },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dapui.setup()
dap.listeners.after.event_initialized['dapui-config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui-config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui-config'] = function()
  dapui.close()
end

-- find better mapping
vim.keymap.set('n', '<leader>b', function()
  dap.toggle_breakpoint()
end)
vim.keymap.set('n', '<leader>xn', function()
  dap.step_over()
end)
vim.keymap.set('n', '<leader>xi', function()
  dap.step_into()
end)
vim.keymap.set('n', '<leader>xo', function()
  dap.step_out()
end)
vim.keymap.set('n', '<leader>xd', function()
  dap.continue()
end)
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.makeprg = 'sh build.sh > log 2> error &'

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
  end,
})

vim.keymap.set('n', '<leader>st', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 5)
  Job_id = vim.bo.channel
  vim.fn.chansend(Job_id, { 'sh build.sh \n\r' })
end)

vim.keymap.set('n', '<leader>b', function()
  vim.fn.chansend(Job_id, { 'sh build.sh \n\r' })
end)

return {
  -- Git related plugins
}
