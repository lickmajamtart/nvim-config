require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "javascript", "typescript", "rust", "vim", "bash" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  playground = { enable = true },
})

