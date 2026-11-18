require("remap")
require("settings")


if vim.g.neovide then
    vim.o.guifont = "Inconsolata LGC Nerd Font Mono:h10"
end


GH = "https://github.com/"

vim.pack.add({
    GH .. "nvim-tree/nvim-web-devicons",
    GH .. "stevearc/oil.nvim",

    GH .. "windwp/nvim-autopairs",

    GH .. "norcalli/nvim-colorizer.lua",
    GH .. "nvim-lualine/lualine.nvim",

    GH .. "sindrets/diffview.nvim",
    GH .. "ibhagwan/fzf-lua",
    GH .. "NeogitOrg/neogit",

    GH .. "unblevable/quick-scope",

    -- gh("mason-org/mason.nvim"),
    -- gh("Decodetalkers/csharpls-extended-lsp.nvim"),
    GH .. "neovim/nvim-lspconfig",

    GH .. "olivercederborg/poimandres.nvim",

    GH .. "nvim-lua/plenary.nvim",
    GH .. "nvim-telescope/telescope.nvim",
    GH .. "nvim-telescope/telescope-fzf-native.nvim",
})

vim.cmd("colorscheme poimandres")


local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>fs", telescope.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})

require("telescope").setup{
    defaults = {
        file_ignore_patterns = { "%.meta", "%.uid", "^vendor/" },
    }
}



vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        -- require("lsp_signature").on_attach()

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
})
vim.lsp.enable("omnisharp")


require("neogit").setup{}

-- vim.keymap.set("n", "<leader>gh", neogit.open({ kind = "split" }))
vim.keymap.set("n", "<leader>gh", "<CMD>Neogit kind=split<CR>")


require("oil").setup({ default_file_explorer = true })
vim.keymap.set("n", "<leader>ep", "<cmd>Oil<CR>")


require("nvim-autopairs").setup({})


require("colorizer").setup({"*"})

require("lualine").setup({
    options = { theme = "horizon" }
})
