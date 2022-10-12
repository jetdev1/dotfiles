require('telescope').setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            hidden = true
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        file_ignore_patterns = {".git/.*", "venv/.*", ".nvim_backup/.*"}
    }
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")
