return {
  'numToStr/Comment.nvim',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>/', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })
  end
}
