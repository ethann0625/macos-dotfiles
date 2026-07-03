require("bufferline").setup({
    options = {
        indicator = {
            style = "icon",
        },
        mode = "tabs",
    },
    highlights = {
        indicator_selected = {
            fg = "#e584f0",
            bg = "#13161B", -- match your bufferline background if needed
        },
    },
})
