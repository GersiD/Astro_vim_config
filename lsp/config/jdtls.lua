return {
  cmd = {
    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. "C:\\Users\\gersi\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\lombok.jar",

    -- 💀
    "-jar",
    "C:\\Users\\gersi\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    "C:\\Users\\gersi\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win",
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    "C:\\Users\\gersi\\.cache\\jdtls\\workspace",
  },
  root_dir = function()
    return vim.fs.dirname(
      vim.fs.find(
        { ".gradlew", ".gitignore", "mvnw", "build.grade.kts" },
        { upward = true, path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) }
      )[1]
    ) .. "\\"
  end,
}
