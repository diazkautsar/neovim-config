return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 40,
          side = "left",
        },

        filters = {
          dotfiles = false,
        },

        -- IMPORTANT PART
        sync_root_with_cwd = true,

        update_focused_file = {
          enable = true,
          update_root = true,
        },

        respect_buf_cwd = true,

        hijack_directories = {
          enable = true,
        },

        renderer = {
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },

        filesystem_watchers = {
          enable = true
        },

        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          show_on_open_dirs = true,
        },

        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
      })
    end,
  },
}

