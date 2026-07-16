-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Detect external file changes
local file_change_group = vim.api.nvim_create_augroup('file-change-detection', { clear = true })

vim.api.nvim_create_autocmd({ 'FocusGained', 'VimResume', 'CursorHold' }, {
    group = file_change_group,
    callback = function()
        vim.cmd.checktime()
    end,
})
