vim.o.winborder = 'single'

cols = {
    '#e584f0',
    '#ff66a3',
    '#ae75eb',
    '#b1ed82',
}

cols_mono = {
    '#0a0b0c', -- [1]
    '#101115', -- [2]
    '#1d232e', -- [3]
    '#1f2226', -- [4]
    '#2A3442', -- [5]
    '#415066', -- [6]
    '#4D5e6c', -- [7]
    '#fafafa', -- [8]
}

-- Errors 
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = cols[2], bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = cols[1], bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = cols[4], bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = cols_mono[7], bg = "NONE" })

-- float menus
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = cols_mono[1] })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = cols_mono[8], bg = cols_mono[1] })

-- class, interface, enum names
vim.api.nvim_set_hl(0, '@lsp.type.class', { fg = cols[4] } )
vim.api.nvim_set_hl(0, '@lsp.type.interface', { fg = cols[4] })
vim.api.nvim_set_hl(0, '@lsp.type.enum', { fg = cols[4] })
vim.api.nvim_set_hl(0, '@lsp.type.enumMember', { fg = cols[4], bold=true })


vim.api.nvim_set_hl(0, '@lsp.type.modifier', { fg = cols[1] })

-- java-specific
vim.api.nvim_set_hl(0, '@lsp.type.javaMethodDecl', { fg = cols[4] })

