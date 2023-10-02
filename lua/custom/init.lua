vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>B", vim.cmd.make)

local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/ssda/download/extension/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.keymap.set('n', '<leader>b', ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set('n', '<leader>xd', ":lua require('dap').continue()<CR>")

