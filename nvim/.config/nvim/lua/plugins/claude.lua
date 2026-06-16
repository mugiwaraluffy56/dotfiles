return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal = {
        side = "right",
        provider = "snacks",
        opts = {
          win = { title = false },
        },
      },
    },
    cmd = { "ClaudeCode", "ClaudeCodeToggle", "ClaudeCodeSend", "ClaudeCodeDiffAccept", "ClaudeCodeDiffDeny" },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>",          desc = "Claude Code" },
      { "<leader>at", "<cmd>ClaudeCodeToggle<cr>",    desc = "Toggle Claude" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",      mode = { "n", "v" }, desc = "Send to Claude" },
      { "<leader>af", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ar", "<cmd>ClaudeCodeDiffDeny<cr>",  desc = "Reject diff" },
    },
  },
}
