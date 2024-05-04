local M = {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
}

function M.config()
  local status_ok, toggleterm = pcall(require, 'toggleterm')
  if not status_ok then
    return
  end

  vim.cmd "let &shell = has('win32') ? 'powershell' : 'pwsh'"
  vim.cmd "let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'"
  vim.cmd "let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'"
  vim.cmd "let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'"
  vim.cmd 'set shellquote= shellxquote='

  toggleterm.setup {
    size = 65,
    open_mapping = [[<c-t>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = 'vertical',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
    },
  }

  function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  end

  vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new { cmd = 'lazygit', direction = 'float', size = 20, hidden = true }

  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end
end

function _G.toggle_specific_term(count)
  local cmd = count .. 'ToggleTerm'
  vim.cmd(cmd)
end

-- Autocommand to set terminal mode keymap for toggling specific terminals
vim.api.nvim_create_autocmd('TermEnter', {
  pattern = 'term://*toggleterm#*',
  callback = function()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<C-t>', '<Cmd>lua toggle_specific_term(vim.v.count1)<CR>', opts)
  end,
})

-- Normal mode keymap to toggle specific terminals
vim.api.nvim_set_keymap('n', '<C-t>', '<Cmd>lua toggle_specific_term(vim.v.count1)<CR>', { noremap = true, silent = true })

-- Insert mode keymap to toggle specific terminals
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc><Cmd>lua toggle_specific_term(vim.v.count1)<CR>', { noremap = true, silent = true })

-- Additional configuration...

return M
