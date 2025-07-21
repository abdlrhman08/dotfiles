local statusline = {
  ' %t',
  '%r',
  '%m',
  '%=',
  '%{&filetype}',
  ' %2p%%',
  ' %3l:%-2c '
}

function getMode()
    print(vim.api.nvim_get_mode())
end

vim.o.statusline = table.concat(statusline, '')
