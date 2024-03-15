local M = {
	"stevearc/conform.nvim",
	event = "BufReadPre",
}
function M.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			html = { { "prettierd", "prettier" } },
			css = { { "prettierd", "prettier" } },
		},
	})
	vim.keymap.set({"n","v"},"<leader>f",function ()
		local conform =require("conform")
		conform.format({
			lsp_fallback=true,
			async=false,
			timeout_ms=500,
		})
	end,{desc="Format file or range (in visual mode)"})
end


return M
