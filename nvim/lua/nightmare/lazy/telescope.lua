local file_ignore_patterns = {
  "node_modules",
  ".output",
  "dist",
  ".idea",
  ".vscode",
  ".cache",
  ".nuxt",
}

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons' ,
      'andrew-george/telescope-themes',
    },
    confing = function()
      local telescope = require('telescope')
      telescope.load_extension('themes')
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = { height = 0.5, width = 0.95 },
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = file_ignore_patterns
        },

        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {}
          }
        },

        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
            file_ignore_patterns = file_ignore_patterns
          }
        }
      })
      telescope.load_extension('ui-select')
    end
  }
}
