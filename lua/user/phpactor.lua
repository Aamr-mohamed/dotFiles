local M = {
  'gbprod/phpactor.nvim',
  event = 'BufReadPre',
  run = 'composer install --no-dev -o',
}

function M.config()
  require('phpactor').setup {
    install = {
      bin = vim.fn.stdpath("data") .. "/mason/bin/phpactor",  -- Adjust the path if needed
      composer = 'composer',
    },
    lspconfig = {
      enabled = true,
      options = {},
    },
  }
end

return M

