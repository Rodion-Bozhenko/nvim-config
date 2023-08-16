vim.cmd([[highlight IndentBlanklineContextChar guifg=#9ccfd8 gui=nocombine]])
require("indent_blankline").setup({
	show_current_context = true,
})
