-- Neovim api aliases
local cmd = vim.cmd -- Execute Vim commands
local exec = vim.api.nvim_exec -- Execute Vimscript
local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)
--local fn = vim.fn       				    -- Call Vim functions

-- General
opt.mouse = "" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menu,menuone,noselect,noinsert" -- Autocomplete options

-- Neovim UI
opt.number = true -- Show line number
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Orizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = false -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.wrap = false -- Do not wrap

-- Tabs, indent
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-- Memory, CPU
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-- Disable nvim intro
opt.shortmess:append("sI")

-- Remove whitespace on save
-- cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

-- Don't auto commenting new lines
cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]])
