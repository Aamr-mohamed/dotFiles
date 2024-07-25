local M = {
  'catppuccin/nvim', -- "se-omarayman/onedark.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}
M.name = 'catppuccin'
function M.config()
  require('catppuccin').setup {
    flavour = 'mocha',
    color_overrides = {
      mocha = {
        rosewater = '#ffc9c9',
        flamingo = '#ff9f9a',
        pink = '#ffa9c9',
        mauve = '#df95cf',
        lavender = '#a990c9',
        red = '#ff6960',
        maroon = '#f98080',
        yellow = '#f9bd69',
        green = '#b0d080',
        teal = '#a0dfa0',
        sky = '#a0d0c0',
        blue = '#89a0e0',
        subtext1 = '#d5c4a1',
        subtext0 = '#bdae93',
        overlay2 = '#928374',
        overlay1 = '#7c6f64',
        overlay0 = '#665c54',
        surface2 = '#504844',
        surface1 = '#3a3634',
        surface0 = '#252525',
        base = '#1d1d1d',
        mantle = '#0e0e0e',
        crust = '#080808',
      },
    },
  }
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end
return M
