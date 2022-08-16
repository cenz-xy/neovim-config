-- Define keymaps of neovim and installed plugins
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a space
vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Map Esc to kk
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Tabbing
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- Bufferline
vim.cmd([[
  nnoremap <leader><TAB> :BufferLineCycleNext<CR>
  nnoremap <leader><S-TAB> :BufferLineCyclePrev<CR>
]])

-- Luasnip
vim.keymap.set({ "i", "s" }, "<silent><TAB>", function()
	if require("luasnip").jumpable(1) then
		require("luasnip").jump(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<silent><S-TAB>", function()
	if require("luasnip").jumpable(-1) then
		require("luasnip").jump(-1)
	end
end)
