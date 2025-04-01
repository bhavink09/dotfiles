return {
		"neovim/nvim-lspconfig",
		"simrat39/rust-tools.nvim",
		config = function()
          local lspconfig = require("lspconfig")
          local rust_tools = require("rust-tools")
          
          rust_tools.setup({
              server = {
                  on_attach = function(client, bufnr)
                      -- Enable key mappings
                      local opts = { noremap = true, silent = true, buffer = bufnr }
                      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          
                      -- Autoformat on save
                      vim.api.nvim_create_autocmd("BufWritePre", {
                          buffer = bufnr,
                          callback = function() vim.lsp.buf.format() end
                      })
                  end,
                  settings = {
                      ["rust-analyzer"] = {
                          checkOnSave = {
                              command = "clippy",
                          },
                          inlayHints = {
                              lifetimeElisionHints = { enable = true },
                              parameterHints = { enable = true },
                              typeHints = { enable = true },
                          },
                      },
                  },
              },
          })
       end
}

