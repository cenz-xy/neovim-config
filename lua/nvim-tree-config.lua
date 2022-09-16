require'nvim-tree'.setup {
    auto_reload_on_write = true,

    view = {
        width = 25,
        height = 25,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },

    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  "
            }
        },
        icons = {
            webdev_colors = true,
            git_placement = "before"
        }
    }
}
