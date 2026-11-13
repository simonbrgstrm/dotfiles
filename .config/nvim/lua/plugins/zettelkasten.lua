return {
  "wsdjeg/zettelkasten.nvim",
  cmd = { "ZkNew", "ZkBrowse" },
  keys = {
    { "<leader>zn", "<cmd>ZkNew<cr>", desc = "New Zettelkasten note" },
    { "<leader>zb", "<cmd>ZkBrowse<cr>", desc = "Browse Zettelkasten notes" },
    {
      "<leader>zs",
      function()
        local template_dir = require("zettelkasten.config").template_dir
        require("zettelkasten").zknew({ template = vim.fn.expand(template_dir .. "/ai-session.md") })
      end,
      desc = "New AI session summary",
    },
  },
  opts = {
    notes_path = "~/.zettelkasten",
    template_dir = "~/.zettelkasten_template",
  },
}
