local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
		file_ignore_patterns = {
			"yarn.lock",
			"package-lock.json",
			"node_modules/*",
			".terraform/*",
			"*.log",
			"dist/*",
			"build/*",
		},
		preview = {
			treesitter = false,
			filesize_limit = 1,
			highlight_limit = false,
		},
	},
	pickers = {
		live_grep = {
			min_chars = 3,
		},
	},
})

telescope.load_extension("fzf")
