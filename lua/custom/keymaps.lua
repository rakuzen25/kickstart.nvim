local map = vim.keymap.set

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

map('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
-- map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>bd', function()
  Snacks.bufdelete()
end, { desc = 'Delete Buffer' })
map('n', '<leader>bo', function()
  Snacks.bufdelete.other()
end, { desc = 'Delete Other Buffers' })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- lazygit
if vim.fn.executable 'lazygit' == 1 then
  map('n', '<leader>gg', function()
    Snacks.lazygit()
  end, { desc = 'Lazygit (cwd)' })
  map('n', '<leader>gf', function()
    Snacks.lazygit.log_file()
  end, { desc = 'Lazygit Current File History' })
  map('n', '<leader>gL', function()
    Snacks.lazygit.log()
  end, { desc = 'Lazygit Log (cwd)' })
end

map('n', '<leader>gb', function()
  Snacks.git.blame_line()
end, { desc = 'Git Blame Line' })
map({ 'n', 'x' }, '<leader>gB', function()
  Snacks.gitbrowse()
end, { desc = 'Git Browse (open)' })
map({ 'n', 'x' }, '<leader>gY', function()
  Snacks.gitbrowse {
    open = function(url)
      vim.fn.setreg('+', url)
    end,
    notify = false,
  }
end, { desc = 'Git Browse (copy)' })
