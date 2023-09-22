vim.cmd[[


imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 


smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'




]]

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
