return {
  -- capabilities = capabilities,
  filetypes = { "css", "scss", "vue" },
  -- root_dir = util.root_pattern("package.json", ".git"),
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
}
