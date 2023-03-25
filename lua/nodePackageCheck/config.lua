local config = {}

-- patterns
config.package_version_pattern = function()
	return '"@?[%w-/_@]+":%s?"[~%^]?%d+%.%d+%.%d+"'
end
-- End

-- Clean namespace
config.get_namespace_id = function()
	return vim.api.nvim_create_namespace("nodePackageCheck")
end
-- End

-- highlight groups
config.error_highlight = function()
	vim.api.nvim_command("highlight error_highlight guifg=#e74c3c guibg=#e74c3cad")
end

config.success_highlight = function()
	vim.api.nvim_command("highlight success_highlight guifg=#27ae60 guibg=#27ae6075")
end

config.info_highlight = function()
	vim.api.nvim_command("highlight info_highlight guifg=#3498db guibg=#3498db8a")
end

config.warning_highlight = function()
	vim.api.nvim_command("highlight warning_highlight guifg=#f1c40f guibg=#f1c40f6b")
end
-- End

-- Virtual text exception
config.virtual_text_option = function(buffer, virt_text, group_h, line_num, col_num)
	local namespace_id = config.get_namespace_id()
	local opts = {
		-- end_line = 10,
		virt_text = { { virt_text, group_h } },
		virt_text_pos = "overlay",
		-- virt_text_win_col = 20,
	}
	vim.api.nvim_buf_set_extmark(buffer, namespace_id, line_num, col_num, opts)
end
-- End

-- Messages
config.ERROR_MESSAGES = {
	WRONG_FILE = "Error: please use this command in a package.json file",
	NO_PACKAGE = "This line doesn't contain any package",
	PACKAGE_NOT_FOUND = "The package is not found",
	MISSING_PACKAGE_NAME = "Error: please provide the package name",
}

config.INFO_MESSAGES = {
	GOOD_VERSION = "Info: You are using already the latest version",
	QUESTION = "DO you want to update this package version [Y/N]: ",
}
-- END

return config
