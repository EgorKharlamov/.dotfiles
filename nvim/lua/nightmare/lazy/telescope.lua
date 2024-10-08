return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons' ,
    }
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = { height = 0.5, width = 0.95 },
        },

        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {}
          }
        },

        pickers = {
          find_files = {
            hidden = true
          }
        }
      })
      telescope.load_extension('ui-select')
    end
  }
}
