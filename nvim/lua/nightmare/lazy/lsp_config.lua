return {
  {
    'williamboman/mason.nvim',
    config = function()
      local mason = require('mason')
      mason.setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {"williamboman/mason.nvim"},
    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
        ensure_installed = {"lua_ls", "ts_ls", "volar", "emmet_language_server"}
      })
    end
  },
  {
    'folke/neoconf.nvim'
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "williamboman/mason.nvim",
      'williamboman/mason-lspconfig.nvim',
      'folke/neoconf.nvim'
    },
    config = function()
      local neoconf = require('neoconf')
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')

      neoconf.setup({})
      mason_lspconfig.setup_handlers({
        function(server_name)
          local server_config = {}
          if neoconf.get(server_name .. ".disable") then
            return
          end
          if server_name == "volar" then
              server_config.filetypes = { 'vue', 'typescript', 'javascript' }
          end
          lspconfig[server_name].setup(server_config)
        end,
      })

      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.volar.setup({
        filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        init_options = {
          vue = {
            hybridMode = false,
          },
          typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
          },
        },
      })
      lspconfig.emmet_language_server.setup({
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "vue" },
        -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
        -- **Note:** only the options listed in the table are supported.
        init_options = {
          ---@type table<string, string>
          includeLanguages = {},
          --- @type string[]
          excludeLanguages = {},
          --- @type string[]
          extensionsPath = {},
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
          preferences = {},
          --- @type boolean Defaults to `true`
          showAbbreviationSuggestions = true,
          --- @type "always" | "never" Defaults to `"always"`
          showExpandedAbbreviation = "always",
          --- @type boolean Defaults to `false`
          showSuggestionsAsSnippets = false,
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
          syntaxProfiles = {},
          --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
          variables = {},
        },
      })

        local keymap = vim.keymap
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>") -- list available help tags

    end
  },
}
