local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    {
      "hrsh7th/cmp-buffer",
    },
    {
      "hrsh7th/cmp-path",
    },
    {
      "hrsh7th/cmp-cmdline",
    },
    {
      "saadparwaiz1/cmp_luasnip",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
  },
  event = {
    "InsertEnter",
  },
}


function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  luasnip.filetype_extend("typescript", { "javascript" })
  luasnip.filetype_extend("typescriptreact", { "javascript" })
  require("luasnip/loaders/from_vscode").lazy_load()

  local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰆧",
    Constructor = "󰆧",
    Field = "",
    Variable = "",
    Class = "󰌗",
    Interface = "",
    Module = "󰅩",
    Property = "",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰉨",
    Snippet = "󰃐",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰇽",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
  }

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
     -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
	   c = cmp.mapping.close(),

      },
	  ["<C-y>"] = cmp.mapping.confirm {select=true}
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
