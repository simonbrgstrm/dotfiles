-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Autocommand for formatting 'fileareas-patch.yaml'
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "fileareas-patch.yaml",
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local formatted_lines = {}
    local inside_block = false

    -- Temporarily disable auto-indentation
    local original_autoindent = vim.o.autoindent
    local original_smartindent = vim.o.smartindent
    vim.o.autoindent = false
    vim.o.smartindent = false

    for _, line in ipairs(lines) do
      if inside_block then
        if line:match("^%S") and not line:match("^%d+$") then
          inside_block = false
        else
          line = ("    " .. line:gsub("^%s*", "")) -- indent by 4 spaces
        end
      end

      table.insert(formatted_lines, line)

      if line:match("^%s*fileareas.txt:%s*|%s*$") then -- Detect block start
        inside_block = true
      end
    end

    -- Restore indentation settings
    vim.o.autoindent = original_autoindent
    vim.o.smartindent = original_smartindent

    vim.api.nvim_buf_set_lines(0, 0, -1, false, formatted_lines)
  end
})
