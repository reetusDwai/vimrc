-- setup - Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
    ]]


-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

lvim.plugins = {
  {
    "glepnir/oceanic-material",
    config = function()
      vim.g.oceanic_material_background = "deep"
      vim.g.oceanic_material_transparent_background = true
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "MunifTanjim/nui.nvim"
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>jf', builtin.find_files, {})
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    int = function()
      vim.cmd [[packadd telescope.nvim]]
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>jf', builtin.project, {})
    end,
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    build = "make",
    event = "BufRead",
  },
  { "dense-analysis/ale" }
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "project")
  pcall(telescope.load_extension, "fzy_native")
  -- any other extensions loading
end

vim.wo.relativenumber = true

lvim.builtin.treesitter.rainbow.enable = true

lvim.colorscheme = "oceanic_material"
lvim.format_on_save.enabled = true
