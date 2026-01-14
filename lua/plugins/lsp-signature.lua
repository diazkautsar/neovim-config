return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
      bind = true,
      floating_window = true,
      hint_enable = false,
      fix_pos = false,
      always_trigger = false,
      close_timeout = 1000,
      handler_opts = {
        border = "rounded",
      },
    }
 }

