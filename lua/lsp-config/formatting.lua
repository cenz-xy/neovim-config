local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
		if client.resolved_capabilities.document_highlight then
			vim.cmd([[
                augroup document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]])
		end
	end,
})
