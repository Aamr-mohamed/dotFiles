local M = {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter"
}

function M.config()
  require 'nvim-treesitter.configs'.setup {
    autotag = {
      enable = true,
    }
  }
end

return M
