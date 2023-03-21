return {
  -- cmd = {
  --   "C:/Users/gersi/.rustup/toolchains/stable-x86_64-pc-windows-msvc/bin/rust-analyzer.exe",
  -- },
  -- cargo = {
  --   features = "all",
  -- },
  checkOnSave = {
    overrideCommand = {
      "cargo",
      "clippy",
      "--workspace",
      "--message-format=json",
      "--all-targets",
      "--all-features",
    },
  },
  procMacro = {
    enable = true,
  },
}
