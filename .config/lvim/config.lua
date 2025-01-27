-- general
-- lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "gruvbox"
lvim.colorscheme = "badwolf"

lvim.transparent_window = true

-- keymappings [view all the defaults by pressing <leader>]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymappin
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymappin
-- lvim.keys.normal_mode["C-q>"] = ":q<cr>"

vim.opt.relativenumber = true

lvim.builtin.bufferline.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["v"] = { "<cmd>:e ~/zettelkasten/index.md<CR>", "VimWiki" }

-- lvim.builtin.which_key.mappings["_"] = { "<cmd>:sp<CR>", "Horsplit" }
-- lvim.builtin.which_key.mappings["|"] = { "<cmd>:vs<CR>", "Versplit" }

lvim.builtin.which_key.mappings["w"] = {
  name = "+Window",
  h = { "<cmd>sp<CR>", "Horizontal Split" },
  v = { "<cmd>vs<CR>", "Vertical Split" },
}

-- Barbar buffers
lvim.builtin.which_key.mappings["b"] = {
  name = "+Buffers",
  b = { "<cmd>Telescope buffers<CR>", "Buffers" },
  h = { "<cmd>BufferPrevious<CR>", "Prev buffer" },
  l = { "<cmd>BufferNext<CR>", "Next buffer" },
  c = { "<cmd>BufferClose<CR>", "Close buffer" },
  s = { "<cmd>BufferPick<CR>", "Buffer pick" },
}

-- Telescope which-key
lvim.builtin.which_key.mappings["f"] = {
  name = "+Telescope",
  b = { "<cmd>Telescope buffers<CR>", "Buffers" },
  d = { "<cmd>Telescope lsp_definitions<CR>", "Defenition" },
  f = { "<cmd>Telescope find_files<CR>", "File Browser" },
  g = { "<cmd>Telescope git_files<CR>", "Git File Find" },
  j = { "<cmd>Telescope jumplist<CR>", "Jumplist" },
  m = { "<cmd>Telescope marks<CR>", "Marks" },
  p = { "<cmd>Telescope projects<CR>", "Projects" },
  r = { "<cmd>Telescope lsp_reference<CR>", "Reference" },
  w = { "<cmd>Telescope live_grep<CR>", "Find word" },
}


-- Telescope settings
lvim.builtin.telescope.defaults.initial_mode = "insert"
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
lvim.builtin.telescope.defaults.layout_config.width = 0.75
lvim.builtin.telescope.defaults.layout_config.height = 0.90
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.pickers.find_files.layout_strategy = "horizontal"
lvim.builtin.telescope.pickers.live_grep.layout_strategy = "horizontal"
lvim.builtin.telescope.pickers.git_files.layout_strategy = "horizontal"

-- Alpha dashboard
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"

-- Dashboard.nvim
-- local home = os.getenv("HOME")
-- package.path = string.format("%s/.config/lvim/?.lua;%s", home, package.path)
-- require('mydashboard')

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
}
lvim.builtin.treesitter.ignore_install = { "haskell", "yaml" }
lvim.builtin.treesitter.highlight.enabled = true

-- lualine conf
lvim.builtin.lualine.style = "lvim" -- or "none"
lvim.builtin.lualine.options.theme = "gruvbox_dark"

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
--
local lspconfig = require("lspconfig")
lspconfig.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}
--
lvim.lsp.on_attach_callback = function(client, _)
  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment",
          "excluded_code",
          "identifier",
          "keyword",
          "keyword_control",
          "number",
          "operator",
          "operator_overloaded",
          "preprocessor_keyword",
          "string",
          "whitespace",
          "text",
          "static_symbol",
          "preprocessor_text",
          "punctuation",
          "string_verbatim",
          "string_escape_character",
          "class_name",
          "delegate_name",
          "enum_name",
          "interface_name",
          "module_name",
          "struct_name",
          "type_parameter_name",
          "field_name",
          "enum_member_name",
          "constant_name",
          "local_name",
          "parameter_name",
          "method_name",
          "extension_method_name",
          "property_name",
          "event_name",
          "namespace_name",
          "label_name",
          "xml_doc_comment_attribute_name",
          "xml_doc_comment_attribute_quotes",
          "xml_doc_comment_attribute_value",
          "xml_doc_comment_cdata_section",
          "xml_doc_comment_comment",
          "xml_doc_comment_delimiter",
          "xml_doc_comment_entity_reference",
          "xml_doc_comment_name",
          "xml_doc_comment_processing_instruction",
          "xml_doc_comment_text",
          "xml_literal_attribute_name",
          "xml_literal_attribute_quotes",
          "xml_literal_attribute_value",
          "xml_literal_cdata_section",
          "xml_literal_comment",
          "xml_literal_delimiter",
          "xml_literal_embedded_expression",
          "xml_literal_entity_reference",
          "xml_literal_name",
          "xml_literal_processing_instruction",
          "xml_literal_text",
          "regex_comment",
          "regex_character_class",
          "regex_anchor",
          "regex_quantifier",
          "regex_grouping",
          "regex_alternation",
          "regex_text",
          "regex_self_escaped_character",
          "regex_other_escape",
        },
      },
      range = true,
    }
  end
end

-- Additional Plugins
lvim.plugins = {
  { "wakatime/vim-wakatime" },
  { "vimwiki/vimwiki" },
  { "sjl/badwolf" },
  { "morhetz/gruvbox" },
  { "nvim-lua/plenary.nvim" },
  { "farmergreg/vim-lastplace" },
  { "martinda/jenkinsfile-vim-syntax" },
  { "pearofducks/ansible-vim" },
  { "towolf/vim-helm" },
  { "justinmk/vim-sneak" },
  { "norcalli/nvim-colorizer.lua" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "alexghergh/nvim-tmux-navigation" },
  { "romgrk/barbar.nvim",                 dependencies = "nvim-web-devicons" },
  { "ckipp01/nvim-jenkinsfile-linter",    dependencies = { "nvim-lua/plenary.nvim" } },
  { "github/copilot.vim" },
  { "zbirenbaum/copilot-cmp" },
  { "nvim-lua/plenary.nvim" },
  { "NoahTheDuke/vim-just" },
  { "CopilotC-Nvim/CopilotChat.nvim",     branch = "canary" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "ggandor/lightspeed.nvim",
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      --config
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      lvim.builtin.which_key.mappings["m"] = {
        name = "+Markdown",
        p = { "<Plug>MarkdownPreview", "Preview" },
      }
      -- vim.keymap.set("n", "<Leader>mp", "<Plug>MarkdownPreview", { desc = "Markdown Preview" })
    end,
  }
}


-- Copilot cmp
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
      require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    end, 100)
  end,
})
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
