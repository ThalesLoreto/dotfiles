return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.tree",
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      require "configs.rustaceanvim"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require "configs.crates"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
