local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

keymap("n", "<leader>pf", builtin.find_files, {})
keymap("n", "<C-p>", builtin.git_files, {})
keymap("n", "<leader>ps", builtin.live_grep, {})
