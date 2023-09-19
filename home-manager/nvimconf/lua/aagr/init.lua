require("aagr.remap")
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
require("aagr.packer")
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.wo.number = true
