return {
  -- gopls with full hints + static analysis
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.venv", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
  },

  -- Go-specific treesitter parsers (deduped with editor.lua)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
    end,
  },

  -- Go keymaps: run shell commands in snacks terminal
  {
    "folke/snacks.nvim",
    opts = {},
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("go_keymaps", { clear = true }),
        pattern = "go",
        callback = function(ev)
          local o = { buffer = ev.buf, silent = true }
          local function term(cmd)
            return function() Snacks.terminal(cmd) end
          end
          vim.keymap.set("n", "<leader>gr", term("go run ."), vim.tbl_extend("force", o, { desc = "go run" }))
          vim.keymap.set("n", "<leader>gt", term("go test ./..."), vim.tbl_extend("force", o, { desc = "go test ./..." }))
          vim.keymap.set("n", "<leader>gT", term("go test -v ./..."), vim.tbl_extend("force", o, { desc = "go test -v" }))
          vim.keymap.set("n", "<leader>gb", term("go build ./..."), vim.tbl_extend("force", o, { desc = "go build" }))
          vim.keymap.set("n", "<leader>gv", term("go vet ./..."), vim.tbl_extend("force", o, { desc = "go vet" }))
          vim.keymap.set("n", "<leader>gi", term("goimports -w ."), vim.tbl_extend("force", o, { desc = "goimports" }))
          vim.keymap.set("n", "<leader>gf", term("gofumpt -w ."), vim.tbl_extend("force", o, { desc = "gofumpt" }))
          vim.keymap.set("n", "<leader>gm", term("go mod tidy"), vim.tbl_extend("force", o, { desc = "go mod tidy" }))
        end,
      })
    end,
  },
}
