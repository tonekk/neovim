require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- telescope
map("n", "<leader><leader>", ":Telescope find_files<cr>")

-- NvimTmuxNavigation
local nvim_tmux_nav = require "nvim-tmux-navigation"

map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Move left" })
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Move down" })
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Move up" })
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Move right" })

map({ "n", "i", "t", "v" }, "<C-q>", ":qall!<cr>", { desc = "quit" })

-- tabufline
map("n", "<Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<Right>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<Left>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- substitute
local substitute = require "substitute"
map("n", "s", substitute.operator, { desc = "   substitute the text object" })
map("n", "ss", substitute.line, { desc = "   substitute the current line" })
map("n", "S", substitute.eol, { desc = "   substitute until eol" })
map("v", "s", substitute.visual, { desc = "   substitute visual selection" })

-- testing
map("n", "<leader>rf", ':let @+ = "bin/rspec " . expand("%") <CR>', { desc = "ﭧ copy test file with rspec cmd" })
map(
  "n",
  "<leader>rn",
  ':let @+ = "bin/rspec " . expand("%") . ":" . line(".") <CR>',
  { desc = "ﭧ copy nearest test for rspec" }
)

-- neotest
map("n", "<leader>rf", function()
  local neotest = require "neotest"
  neotest.output_panel.clear()
  neotest.output_panel.open()
  neotest.run.run(vim.fn.expand "%")
end, { desc = "ﭧ execute all specs in file" })
map("n", "<leader>rn", function()
  require("neotest").run.run()
end, { desc = "ﭧ execute nearest spec(s)" })

-- Unmap nvchad defaults

local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")
