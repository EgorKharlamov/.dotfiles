return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local configs = require("lualine")
    configs.setup({
      options = {
        theme = 'onedark'
        -- theme = 'gruvbox'
      },
      sections = {
        lualine_x = { 'fileformat', 'filetype' },
      }
    })
  end
}
