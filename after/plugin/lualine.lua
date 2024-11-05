local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "onedark",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { branch, diagnostics },
        lualine_b = { mode },
        lualine_c = { "filename", diff },
        lualine_x = { spaces, "encoding", "fileformat", filetype },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
