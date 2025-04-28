local api = vim.api

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Resize splits if window got resized
api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local exclude = { "gitcommit" }
    local buf = api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = api.nvim_buf_get_mark(buf, '"')
    local lcount = api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Check if we need to reload the file when it changed
api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  command = "checktime",
})

-- Show cursor line only in active window
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(api.nvim_win_get_var, 0, "auto_cursorline")
    if ok and cl then
      api.nvim_win_set_var(0, "auto_cursorline", false)
      vim.wo.cursorline = false
    end
  end,
})

api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local ok, cl = pcall(api.nvim_win_get_var, 0, "auto_cursorline")
    if ok and cl then
      api.nvim_win_set_var(0, "auto_cursorline", false)
      vim.wo.cursorline = true
    end
  end,
})

-- Create directories when saving a file, if they don't exist
api.nvim_create_autocmd("BufWritePre", {
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
}) 