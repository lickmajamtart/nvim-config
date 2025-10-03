return {
  { "nvim-lua/plenary.nvim" },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Grep in project" },
      { "<leader>cf", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "typescript", "rust", "vim", "bash" },
        highlight = { enable = true },
        playground = { enable = true },
      })
    end,
  },

  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file to Harpoon" },
      { "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Harpoon menu" },
      { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" },
      { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>" },
      { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>" },
      { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>" },
    }
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" },
    },
  },

  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd.colorscheme("rose-pine")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      local lsp = require("lsp-zero").preset({})
      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        local km = vim.keymap.set
        km("n", "gd", vim.lsp.buf.definition, opts)
        km("n", "K", vim.lsp.buf.hover, opts)
        km("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        km("n", "<leader>vd", vim.diagnostic.open_float, opts)
        km("n", "[d", vim.diagnostic.goto_next, opts)
        km("n", "]d", vim.diagnostic.goto_prev, opts)
        km("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        km("n", "<leader>rr", vim.lsp.buf.references, opts)
        km("n", "<leader>rn", vim.lsp.buf.rename, opts)
        km("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end)
      lsp.setup()
    end,
  },
}

