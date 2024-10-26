local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_ok then
    return
end

local function custom_on_attach(bufnr)
    local api_ok, api = pcall(require, "nvim-tree.api")
    if not api_ok then
        return
    end

    local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
    local keymap = vim.keymap.set

    api.config.mappings.default_on_attach(bufnr)

    keymap("n", "h", api.node.navigate.parent_close, opts)
    keymap("n", "l", api.node.open.edit, opts)
end

nvim_tree.setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        width = 30,
        side = left,
        -- adaptive_size = true,
    },
    on_attach = custom_on_attach,
})
