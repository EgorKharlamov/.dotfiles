return {
  "stevearc/aerial.nvim",
  opts = {
    backends = { "treesitter", "lsp", "markdown", "man" },

    layout = {
      max_width = { 40, 0.2 },
      min_width = 30,
      default_direction = "right", -- или "left"
    },

    filter_kind = false,

    on_attach = function(bufnr)
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
