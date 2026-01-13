return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true, -- IMPORTANT
        ts_config = {
          javascript = { "string", "template_string" },
          typescript = { "string", "template_string" },
          javascriptreact = { "jsx_element" },
          typescriptreact = { "jsx_element" },
        },
      })
    end,
  },
}

