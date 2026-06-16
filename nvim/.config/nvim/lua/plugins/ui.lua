return {
  -- Colorscheme: Catppuccin Mocha
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      integrations = {
        blink_cmp = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        neo_tree = true,
        noice = true,
        notify = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
        snacks = true,
      },
    },
  },

  -- Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- Snacks: terminal, dashboard, explorer, notifications
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          keys = {
            { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.picker.files()" },
            { icon = " ", key = "n", desc = "New File",        action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text",       action = ":lua Snacks.picker.grep()" },
            { icon = " ", key = "r", desc = "Recent Files",    action = ":lua Snacks.picker.recent()" },
            { icon = " ", key = "c", desc = "Config",          action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy",           action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit",            action = ":qa" },
          },
        },
        -- Hide header when window too short to fit everything
        sections = {
          {
            section = "header",
            enabled = function() return vim.o.lines > 28 end,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
      terminal = {
        win = {
          position = "float",
          border = "rounded",
          height = 0.8,
          width = 0.8,
        },
      },
      picker = {
        enabled = true,
      },
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
      indent = { enabled = true },
      scroll = { enabled = true },
      words = { enabled = true },
    },
  },

  -- Better notifications
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
  },

  -- Lualine statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_extend("force", opts.options or {}, {
        theme = "catppuccin-mocha",
        globalstatus = true,
        disabled_filetypes = { statusline = { "snacks_dashboard", "dashboard", "alpha" } },
      })
      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
      return opts
    end,
  },

  -- Indent guides (v3 API: main = "ibl")
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = {
        filetypes = { "help", "snacks_dashboard", "dashboard", "neo-tree", "lazy", "mason", "notify" },
      },
    },
  },
}
