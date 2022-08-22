local nnoremap = require("nitesh.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

--telescope
nnoremap("<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<C-_>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
nnoremap("<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>pg", "<cmd>lua require('telescope.builtin').grep_string()<CR>")

