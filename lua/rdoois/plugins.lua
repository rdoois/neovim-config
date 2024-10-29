local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    
    print "Installing packer close and reopen Neovim..."
    cmd [[packadd packer.nvim]]
end

cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local ok, packer = pcall(require, "packer")
if not ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "datsfilipe/min-theme.nvim"
    use "nvim-lua/plenary.nvim"
    use {"nvim-telescope/telescope.nvim", tag = "0.1.8"}
    use ("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
    use {"theprimeagen/harpoon", branch = "harpoon2"}
    use "mbbill/undotree"
    use "tpope/vim-fugitive"
    use "nvim-tree/nvim-web-devicons"
    use "nvim-tree/nvim-tree.lua"
    use "akinsho/toggleterm.nvim"

    use {
        "vonheikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'l3mon4d3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
end)
