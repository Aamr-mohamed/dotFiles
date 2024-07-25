local M = {
  'stevearc/conform.nvim',
  event = 'BufReadPre',
}
function M.config()
  require('conform').setup {
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform will run multiple formatters sequentially
      -- Use a sub-list to run only the first available formatter
      javascript = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      php = { 'intelephense' },
      blade = { 'blade-formatter', 'php-cs-fixer','vim-blade' },
    },
    formatters = {
      ['php-cs-fixer'] = {
        command = 'php-cs-fixer',
        args = {
          'fix',
          '$FILENAME',
          '--config=/home/se-amr/.config/nvim/lua/.php-cs-fixer.php',
          '--allow-risky=yes', -- if you have risky stuff in config, if not you don't need it.
        },
        stdin = false,
      },
    },
  }
  vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
    local conform = require 'conform'
    conform.format {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
      notify_on_error = true,
    }
  end, { desc = 'Format file or range (in visual mode)' })
end

return M
