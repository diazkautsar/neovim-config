return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- ADD THIS LINE
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "html", "javascript", "typescript", "tsx", "json", "css" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

