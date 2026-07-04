require("conform").setup({
    formatters_by_ft = {
        python = { "yapf" },
        tex = { "latexindent" },
        bib = { "bibtex-tidy" },
        lua = { "stylua" },
        sh = { "beautysh" },

        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
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

        prettier = {
            prepend_args = {
                "--print-width",
                "100",
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
