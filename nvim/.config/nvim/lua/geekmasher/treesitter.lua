require 'nvim-treesitter.configs'.setup {
  autopairs = {
    enable = true
  },
  ensure_installed = {
    'css',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'python',
    'tsx',
    'typescript',
    'svelte'
  },
  incremental_selection = {
    enable = true
  },
  textobjects = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = {
      'svelte'
    }
  }
}
