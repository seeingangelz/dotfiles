local status_ok, treesitter = pcall(require, "treesitter")
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = { "c", "lua", "python", "html", "css", "javascript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
}
