return {
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
	config = function()
	  local dap = require("dap")
      local dapui = require("dap-ui")

      dapui.setup()
      dap.adapters.lldb = {
          type = "executable",
          command = "/usr/bin/lldb-vscode", -- Adjust if necessary
          name = "lldb",
      }
      
      dap.configurations.rust = {
          {
              name = "Launch",
              type = "lldb",
              request = "launch",
              program = function()
                  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
          },
      }
      
      vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
    end,
}
