-- Additional Plugins
lvim.plugins = {
  { "wakatime/vim-wakatime" },
  { "vimwiki/vimwiki" },
  { "sjl/badwolf" },
  { "morhetz/gruvbox" },
  { "rose-pine/neovim" },
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
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken",                          -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
}
