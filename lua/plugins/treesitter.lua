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
