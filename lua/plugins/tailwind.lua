return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")

      lspconfig.tailwindcss.setup({
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "className=\"([^\"]*)\"",
                "class=\"([^\"]*)\"",
              },
            },
          },
        },
      })
    end,
  },
}

