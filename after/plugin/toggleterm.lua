local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    return
end

toggleterm.setup({
    size = 12,
    open_mapping = [[<C-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal", -- float
    close_on_exit = true,
    shell = vim.o.shell,
    -- float_opts = {
    --     border = "curved",
    --     winblend = 0,
    --     highlights = {
    --         border = "Normal",
    --         background = "Normal",
    --     },
    -- },
})