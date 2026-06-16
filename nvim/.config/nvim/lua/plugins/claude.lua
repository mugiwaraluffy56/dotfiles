return {
  -- Official Claude Code Neovim integration (WebSocket MCP protocol)
  -- Same protocol as the official VS Code/JetBrains extensions
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    cmd = { "ClaudeCode", "ClaudeCodeToggle", "ClaudeCodeSend", "ClaudeCodeDiffAccept", "ClaudeCodeDiffDeny" },
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Claude Code" },
      { "<leader>cC", "<cmd>ClaudeCodeToggle<cr>", desc = "Toggle Claude Code" },
      { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = { "n", "v" }, desc = "Send to Claude" },
      { "<leader>cf", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>cr", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
    },
  },
}
