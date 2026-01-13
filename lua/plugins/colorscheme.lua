return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- load first
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
}

