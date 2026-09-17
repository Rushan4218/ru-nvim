return {
  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "bash",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },
  },
}
