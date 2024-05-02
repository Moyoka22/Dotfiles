function FullPathCp()
	-- Get the full path of the current file
	local abs_path = vim.fn.expand('%:p')
	print(abs_path)
	vim.fn.setreg('+', abs_path, c)
end

vim.api.nvim_set_keymap('n', 'cp', ':lua FullPathCp()<CR>', { noremap = true })

function GitAwareCp()
	-- Get the full path of the current file
	local file_path = vim.fn.expand('%:p')

	-- Separate the path into directory and trailing file component
	local dir_path = vim.fn.fnamemodify(file_path, ':h')

	-- Iterate up through directory structure
	while dir_path ~= '/' and dir_path ~= '.' do
		-- Check for .git directory or file
		if vim.fn.isdirectory(dir_path .. '/.git') == 1 then
			-- Found .git, compute relative path
			local relative_path = vim.fn.fnamemodify(file_path, ':.')
			print(relative_path)
			vim.fn.setreg('+', relative_path, c)
			return
		else
			-- Move up one directory level
			dir_path = vim.fn.fnamemodify(dir_path, ':h')
		end
	end

	print("No git directory found in hierarchy")
end

vim.api.nvim_set_keymap('n', 'gcp', ':lua GitAwareCp()<CR>', { noremap = true })

function TelescopeWordUnderCursor()
	require('telescope.builtin').grep_string()
end

vim.api.nvim_set_keymap('n', '<leader>fw', ':lua TelescopeWordUnderCursor()<CR>', { noremap = true })