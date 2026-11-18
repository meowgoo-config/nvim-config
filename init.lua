require("vanya")


function gh(s) return "https://github.com/" .. s end
vim.pack.add({
    gh("nvim-tree/nvim-web-devicons"),
    gh("stevearc/oil.nvim"),

    gh("windwp/nvim-autopairs"),

    gh("norcalli/nvim-colorizer.lua"),
    gh("nvim-lualine/lualine.nvim"),

    gh("sindrets/diffview.nvim"),
    gh("ibhagwan/fzf-lua"),
    gh("NeogitOrg/neogit"),

    gh("unblevable/quick-scope"),

    -- gh("mason-org/mason.nvim"),
    -- gh("Decodetalkers/csharpls-extended-lsp.nvim"),
    gh("neovim/nvim-lspconfig"),
})


-- require("mason").setup()
vim.lsp.enable("omnisharp")

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


-- local neogit = require("neogit")
-- vim.keymap.set("n", "<leader>gh", neogit.open({ kind = "split" }))
vim.keymap.set("n", "<leader>gh", "<CMD>Neogit kind=split<CR>")


require("oil").setup({
    default_file_explorer = true
})

vim.keymap.set("n", "<leader>ep", "<cmd>Oil<CR>")



require("nvim-autopairs").setup({})


require("colorizer").setup({"*"})

require("lualine").setup({
    options = {
        theme = "horizon"
    }
})
