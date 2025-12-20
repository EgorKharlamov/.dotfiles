local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")

      local function prefer_fields(entry1, entry2)
        local kind1 = entry1:get_kind()
        local kind2 = entry2:get_kind()

        local function score(kind)
          if kind == cmp.lsp.CompletionItemKind.Field
             or kind == cmp.lsp.CompletionItemKind.Variable then
            return 0
          elseif kind == cmp.lsp.CompletionItemKind.Property then
            return 1
          elseif kind == cmp.lsp.CompletionItemKind.Function
             or kind == cmp.lsp.CompletionItemKind.Method then
            return 2
          else
            return 3
          end
        end

        local s1 = score(kind1)
        local s2 = score(kind2)
        if s1 ~= s2 then
          return s1 < s2
        end
      end


      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      cmp.setup({
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[nightmare]",
              nvim_lua = "[Lua]",
              latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
          end
        },
        sorting = {
            priority_weight = 2,
            comparators = {
              prefer_fields,
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.score,
              cmp.config.compare.kind,
              cmp.config.compare.sort_text,
              cmp.config.compare.length,
              cmp.config.compare.order,
            },
          },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" }, -- For luasnip users.
          -- { name = "orgmode" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- snippets test
      require('luasnip.loaders.from_lua').load({
        paths = '~/.config/nvim/lua/nightmare/snippets'
      })
    end,
  },
}
