-- keymappings [view all the defaults by pressing <leader>]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymappin
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymappin
-- lvim.keys.normal_mode["C-q>"] = ":q<cr>"
--
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
