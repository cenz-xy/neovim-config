-- Setup nvim-cmp.
local completion = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

completion.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		["<C-d>"] = completion.mapping.scroll_docs(-4),
		["<C-f>"] = completion.mapping.scroll_docs(4),
		["<C-Space>"] = completion.mapping.complete(),
		["<C-e>"] = completion.mapping.close(),
		["<CR>"] = completion.mapping.confirm({
			behavior = completion.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = completion.mapping(function(fallback)
			if completion.visible() then
				completion.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = completion.mapping(function()
			if completion.visible() then
				completion.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		-- { name = "vsnip" },
		-- For ultisnips user.
		-- { name = 'ultisnips' },
	},
	formatting = { format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }) },
})
