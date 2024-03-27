local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
}

function M.config()
  require('harpoon').setup()
end

return M
