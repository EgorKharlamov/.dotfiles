-- Docker compose files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "docker-compose*.yaml", "docker-compose*.yml", "compose.yaml", "compose.yml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
    vim.cmd([[
      highlight link YamlDockerComposeKey @keyword
      highlight link YamlDockerComposeValue @string
    ]])
  end,
})
vim.treesitter.language.register("yaml", "yaml.docker-compose")
-- Docker compose files end
