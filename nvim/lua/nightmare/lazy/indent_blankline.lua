return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = true,
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          -- ...
        },
        indent = {
          enable = false,
          chars = {
            "│",
            "¦",
            "┆",
            "┊",
          },
          style = {
            vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
          },
        },
        line_num = {
          enabled = true,
          style = "#806d9c",
          use_treesitter = false,
        },
        blank = {
          enabled = true,
          chars = {
            " . ",
          },
          style = {
            { bg = "#434437" },
            { bg = "#2f4440" },
            { bg = "#433054" },
            { bg = "#284251" },
          },
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    dependencies = {
      "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
      "TheGLander/indent-rainbowline.nvim",
    },
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = function(_, opts)
      -- Other blankline configuration here
      return require("indent-rainbowline").make_opts(opts, {
        color_transparency = 0.15,
      })
    end,
    -- comment whole function if you wanna rainbow indent
    config = function()
      local configs = require("ibl")
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      configs.setup({
        indent = {
          highlight = highlight,
        },
      })
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    enabled = false,
    config = function()
      local config = require("mini.indentscope")
      config.setup({
        symbol = "╎",
        options = {
          try_as_border = true,
        },
      })
    end,
  },
}
