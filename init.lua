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
