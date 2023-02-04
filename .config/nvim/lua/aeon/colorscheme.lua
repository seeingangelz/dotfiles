vim.cmd [[
try
  colorscheme pywal
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
