local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {'python'},
  },
  ensure_installed = {
    "python",
    "toml",
    "fish",
    "json",
    "yaml",
    "css",
    "html",
    "lua"
  },
  autotag = {
    enable = true,
  },
}
