local root_file = {
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yaml',
  '.eslintrc.yml',
  '.eslintrc.json',
  'eslint.config.js',
  'eslint.config.mjs',
  'eslint.config.cjs',
  'eslint.config.ts',
  'eslint.config.mts',
  'eslint.config.cts',
}

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
        ensure_installed = {"lua_ls", "ts_ls", "volar", "eslint", "dockerls", "docker_compose_language_service", "jsonls", "css_variables", "cssls", "emmet_ls"}
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
      local util = require('lspconfig.util')
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

      local mason_registry = require('mason-registry')
      local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'
      lspconfig.ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vue_language_server_path,
              languages = { 'vue' },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      })
      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,

        root_dir = function(fname)
          local root_file = util.insert_package_json(root_file, 'eslintConfig', fname)
          return util.root_pattern(unpack(root_file))(fname)
        end,

        settings = {
          validate = 'on',
          packageManager = nil,
          useESLintClass = false,
          experimental = {
            useFlatConfig = false,
          },
          codeActionOnSave = {
            enable = true,
            mode = 'all',
          },
          format = true,
          quiet = false,
          onIgnoredFiles = 'off',
          rulesCustomizations = {},
          run = 'onType',
          problems = {
            shortenToSingleLine = false,
          },
          -- nodePath configures the directory in which the eslint server should start its node_modules resolution.
          -- This path is relative to the workspace folder (root dir) of the server instance.
          nodePath = '',
          -- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
          workingDirectory = { mode = 'location' },
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = 'separateLine',
            },
            showDocumentation = {
              enable = true,
            },
          },
        },
      })
      lspconfig.volar.setup({
        capabilities = capabilities,
        filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities
      })
      lspconfig.css_variables.setup({
        filetypes = { "css", "less", "sass", "scss", "vue" },
      })
      lspconfig.cssls.setup({
        filetypes = { "css", "less", "sass", "scss", "vue" },
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact" },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        }      
      })

      lspconfig.dockerls.setup({})
      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities
      })
      vim.filetype.add({
        filename = {
          ["docker-compose.yml"] = "yaml.docker-compose",
          ["docker-compose.yaml"] = "yaml.docker-compose",
          ["compose.yml"] = "yaml.docker-compose",
          ["compose.yaml"] = "yaml.docker-compose",
        },
      })
    end
  },
}
