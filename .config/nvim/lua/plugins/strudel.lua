return {
  "gruvw/strudel.nvim",
  build = "npm ci",
  config = function()
    require("strudel").setup({
      browser_exec_path = "/usr/bin/chromium-browser",
      browser_data_dir = vim.fn.expand("~/snap/chromium/common/strudel-nvim"),
    })
  end,
}
