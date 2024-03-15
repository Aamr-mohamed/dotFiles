local M = {
  'stevearc/oil.nvim',
	event = 'VeryLazy',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
	require("oil").setup()
end


return M
