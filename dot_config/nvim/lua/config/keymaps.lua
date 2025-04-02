-- FloaTerm configurationt
vim.keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set("n", "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")

-- build
vim.keymap.set("n", "<leader>b", ":!cargo build<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":!cargo run<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":!cargo test<CR>", { noremap = true, silent = true })

-- Term Toggle Function
local term_buf = nil
local term_win = nil

function TermToggle(height)
	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.cmd("hide")
	else
		vim.cmd("botright new")
		local new_buf = vim.api.nvim_get_current_buf()
		vim.cmd("resize " .. height)
		if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
			vim.cmd("buffer " .. term_buf) -- go to terminal buffer
			vim.cmd("bd " .. new_buf) -- cleanup new buffer
		else
			vim.cmd("terminal")
			term_buf = vim.api.nvim_get_current_buf()
			vim.wo.number = false
			vim.wo.relativenumber = false
			vim.wo.signcolumn = "no"
		end
		vim.cmd("startinsert!")
		term_win = vim.api.nvim_get_current_win()
	end
end

-- Term Toggle Keymaps
vim.keymap.set("n", "<leader>tn", ":lua TermToggle(20)<CR>", { noremap = true, silent = true })
