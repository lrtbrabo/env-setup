return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if vim.fn.winnr("$") == 1 and vim.bo.filetype ~= "neo-tree" then
          -- If neo-tree is the only window, close it
          vim.cmd("Neotree close")
        elseif vim.bo.filetype ~= "neo-tree" then
          -- Close neo-tree if it's open in another window
          vim.cmd("Neotree close")
        end
      end,
    })
  end
}

