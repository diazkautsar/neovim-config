-- =======================================================
-- init.lua — VSCode-like project root behavior
-- =======================================================

-- 1️⃣ Disable netrw FIRST
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 2️⃣ Set leader
vim.g.mapleader = " "

-- 3️⃣ Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.autochdir = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"


-- 5️⃣ Load plugins
require("core.lazy")

-- mapping auto import typescript
vim.keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.code_action({
    apply = true,
    context = { only = { "source.organizeImports" } },
  })
end, { desc = "Organize Imports" })

-- open diagnostic error
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- open tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- exit all buffer except tree
vim.keymap.set("n", "<leader>bo", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local ft = vim.api.nvim_buf_get_option(buf, "filetype")
      if ft ~= "NvimTree" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end, { desc = "Close all buffers except NvimTree" })

-- auto create missing directories on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(event)
    local dir = vim.fn.fnamemodify(event.file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- refresh nvim tree after file is writen
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    local ok, api = pcall(require, "nvim-tree.api")
    if ok then
      api.tree.reload()
    end
  end,
})


-- 4️⃣ Detect project directory from CLI argument
local arg = vim.fn.argv(0)
if arg and vim.fn.isdirectory(arg) == 1 then
  vim.cmd("cd " .. arg)
end

-- 6️⃣ Open nvim-tree ONLY for directory start
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      require("nvim-tree.api").tree.open()
    end
  end,
})

