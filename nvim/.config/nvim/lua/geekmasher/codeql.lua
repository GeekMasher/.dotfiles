

require("codeql").setup {
  results = {
    max_paths = 10,
    max_path_depth = nil,
  },
  panel = {
    group_by = "sink", -- "source"
    show_filename = true,
    long_filename = false,
  },
  max_ram = 16000,
  format_on_save = true,
  search_path = {
    "/home/geekmasher/.codeql/codeql",
    "/home/geekmasher/.codeql/codeql-go",
    "./codeql",
  },
}

