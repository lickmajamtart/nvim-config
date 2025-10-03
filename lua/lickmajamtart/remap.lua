local map = vim.keymap.set
vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)

map("x", "<leader>p", "\"_dP")

map({"n", "v"}, "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

map({"n", "v"}, "<leader>d", "\"_d")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>x", function()
  local file = vim.fn.expand("%")
  vim.fn.system({"chmod", "+x", file})
  print(file .. " made executable")
end)

