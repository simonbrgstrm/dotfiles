--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "badwolf"

-- keymappings [view all the defaults by pressing <leader>]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymappin
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymappin
-- lvim.keys.normal_mode["C-q>"] = ":q<cr>"

-- Configure builtin plugins
lvim.builtin.notify.active = true

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["v"] = { "<cmd>:e ~/zettelkasten/index.md<CR>", "VimWiki" }

-- lvim.builtin.which_key.mappings["_"] = { "<cmd>:sp<CR>", "Horsplit" }
-- lvim.builtin.which_key.mappings["|"] = { "<cmd>:vs<CR>", "Versplit" }

lvim.builtin.which_key.mappings["w"] = {
  name = "+Window",
  h = { "<cmd>sp<CR>", "Horizontal Split" },
  v = { "<cmd>vs<CR>", "Vertical Split" },
}

lvim.builtin.which_key.mappings["f"] = {
  name = "+Telescope",
  b = { "<cmd>Telescope buffers<CR>", "Buffers" },
  f = { "<cmd>Telescope find_files<CR>", "File Browser" },
  d = { "<cmd>Telescope lsp_definitions<CR>", "Defenition" },
  j = { "<cmd>Telescope jumplist<CR>", "Jump" },
  m = { "<cmd>Telescope marks<CR>", "Marks" },
  p = { "<cmd>Telescope projects<CR>", "Projects" },
  r = { "<cmd>Telescope lsp_reference<CR>", "Reference" },
  w = { "<cmd>Telescope live_grep<CR>", "Find word" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "c_sharp",
  "css",
  "hcl",
  "java",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "tsx",
  "typescript",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- lualine conf
lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.lualine.options.theme = "gruvbox_dark"

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- Additional Plugins
lvim.plugins = {
  { "wakatime/wakatime" },
  { "vimwiki/vimwiki" },
  { "sjl/badwolf" },
  { "tpope/vim-surround" },
  { "nvim-lua/plenary.nvim" },
  { "farmergreg/vim-lastplace" },
  { "martinda/jenkinsfile-vim-syntax" },
  { "justinmk/vim-sneak" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "ggandor/lightspeed.nvim",
  },




}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
