return {
  -- rustaceanvim: the definitive Rust plugin (replaces rust-tools)
  {
    "mrcjkb/rustaceanvim",
    opts = {
      tools = {
        float_win_config = {
          border = "rounded",
        },
        -- Use rustfmt for formatting via rust-analyzer
        on_initialized = function()
          vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            pattern = { "*.rs" },
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
      },
      server = {
        on_attach = function(client, bufnr)
          -- Rust-specific keymaps
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end, vim.tbl_extend("force", opts, { desc = "Runnables" }))
          vim.keymap.set("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end, vim.tbl_extend("force", opts, { desc = "Debuggables" }))
          vim.keymap.set("n", "<leader>re", function() vim.cmd.RustLsp("expandMacro") end, vim.tbl_extend("force", opts, { desc = "Expand macro" }))
          vim.keymap.set("n", "<leader>rc", function() vim.cmd.RustLsp("openCargo") end, vim.tbl_extend("force", opts, { desc = "Open Cargo.toml" }))
          vim.keymap.set("n", "<leader>rp", function() vim.cmd.RustLsp("parentModule") end, vim.tbl_extend("force", opts, { desc = "Parent module" }))
          vim.keymap.set("n", "<leader>rm", function() vim.cmd.RustLsp("moveItem", "down") end, vim.tbl_extend("force", opts, { desc = "Move item down" }))
          vim.keymap.set("n", "<leader>rM", function() vim.cmd.RustLsp("moveItem", "up") end, vim.tbl_extend("force", opts, { desc = "Move item up" }))
          vim.keymap.set("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, vim.tbl_extend("force", opts, { desc = "Hover actions" }))
          vim.keymap.set("n", "<leader>ra", function() vim.cmd.RustLsp("codeAction") end, vim.tbl_extend("force", opts, { desc = "Code actions" }))
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = { enable = true },
            },
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
            inlayHints = {
              bindingModeHints = { enable = false },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true, minLines = 25 },
              closureReturnTypeHints = { enable = "never" },
              lifetimeElisionHints = { enable = "never" },
              maxLength = 25,
              parameterHints = { enable = true },
              reborrowHints = { enable = "never" },
              renderColons = true,
              typeHints = { enable = true, hideClosureInitialization = false, hideNamedConstructor = false },
            },
            files = {
              excludeDirs = {
                ".direnv", ".git", ".github", "target", "node_modules",
              },
            },
          },
        },
      },
    },
  },

  -- Crates.nvim: dependency management in Cargo.toml
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      -- Use LSP + blink.cmp native source; nvim-cmp source deprecated
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
        on_attach = function(_, bufnr)
          local o = { buffer = bufnr, silent = true }
          local c = require("crates")
          vim.keymap.set("n", "<leader>cu", c.upgrade_crate, vim.tbl_extend("force", o, { desc = "Upgrade crate" }))
          vim.keymap.set("n", "<leader>cU", c.upgrade_all_crates, vim.tbl_extend("force", o, { desc = "Upgrade all crates" }))
          vim.keymap.set("n", "<leader>ci", c.show_popup, vim.tbl_extend("force", o, { desc = "Crate info" }))
          vim.keymap.set("n", "<leader>cv", c.show_versions_popup, vim.tbl_extend("force", o, { desc = "Crate versions" }))
          vim.keymap.set("n", "<leader>cf", c.show_features_popup, vim.tbl_extend("force", o, { desc = "Crate features" }))
        end,
      },
    },
  },
}
