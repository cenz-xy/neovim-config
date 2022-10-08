local luasnip = require("luasnip")
local types = require("luasnip.util.types")

-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("javascript", { "javascriptreact" })
-- luasnip.filetype_extend("javascript", { "html" })
-- luasnip.filetype_extend("javascript", { "css" })

luasnip.config.setup({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "GruvboxBlue" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})
