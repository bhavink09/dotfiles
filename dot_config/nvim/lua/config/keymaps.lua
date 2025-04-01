-- FloaTerm configuration
vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- build
vim.keymap.set("n", "<leader>b", ":!cargo build<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":!cargo run<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":!cargo test<CR>", { noremap = true, silent = true })

