return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "BufReadPost",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- use buffers, not tabs
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = true,
        },
      })
    end,
  },
}

