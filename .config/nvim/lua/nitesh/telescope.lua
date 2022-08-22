local action_state = require("telescope.actions.state")
require('telescope').setup {
    defaults = {
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<C-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        }
    }
}

require('telescope').load_extension('fzf')
