return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      format = {
        enable = true,
        -- можно задать стиль:
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
    },
  },
}
