return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    vim.keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>aa", function() harpoon:list():remove() end)
    vim.keymap.set("n", "<A-h>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<A-l>", function() harpoon:list():next() end)

    -- local conf = require("telescope.config").values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end
    --
    --   require("telescope.pickers").new({}, {
    --     prompt_title = "Harpoon",
    --     finder = require("telescope.finders").new_table({
    --         results = file_paths,
    --     }),
    --     previewer = conf.file_previewer({}),
    --     sorter = conf.generic_sorter({}),
    --   }):find()
    -- end
    --
    -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    --   { desc = "Open harpoon window" })
  end
}
