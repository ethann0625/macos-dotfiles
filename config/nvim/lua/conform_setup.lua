require("conform").setup({
    formatters_by_ft = {
        python = { "yapf" },
        tex = { "latexindent" },
        bib = { "bibtex-tidy" },
        lua = { "stylua" },
        sh = { "beautysh" },
    },

    formatters = {
        latexindent = {
            prepend_args = {
                "-",
                "-m",
                "-y=modifyLineBreaks:textWrapOptions:columns:80",
            },
        },

        stylua = {
            prepend_args = {
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
            },
        },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
