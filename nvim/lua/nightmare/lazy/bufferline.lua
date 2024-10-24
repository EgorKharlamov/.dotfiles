return {
  'akinsho/bufferline.nvim', 
  version = "4.7.0", 
  enabled = false,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local configs = require('bufferline')
    configs.setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        },
      },
    })
  end
}
