return {
  -- Disable neo-tree (using snacks Explorer instead)
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Snacks Explorer keymaps
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
    },
    keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>E", function() Snacks.explorer({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Explorer (file dir)" },
    },
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true, opts = { default = true } },
}
