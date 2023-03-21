--Latex
return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_compiler_latexmk = { build_dir = "build" }
    return {
      ["vimtex_view_general_viewer"] = "C:/Users/gersi/AppData/Local/Microsoft/WindowsApps/SumatraPDF.exe",
      ["vimtex_view_method"] = "C:/Users/gersi/AppData/Local/Microsoft/WindowsApps/SumatraPDF.exe",
      ["vimtex_view_general_options"] = "-reuse-instance -forward-search @tex @line @pdf",
      ["vimtex_view_general_options_latexmk"] = "-reuse-instance",
    }
  end,
}
