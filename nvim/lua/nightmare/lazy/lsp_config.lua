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
      local configs = require('lspconfig/configs')
      local mason_lspconfig = require('mason-lspconfig')
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

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
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
          filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
              },
            },
          }      
      })
    end
  },
}
