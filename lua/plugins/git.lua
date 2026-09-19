return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false
    },

    keys = {
      {
        "]c",
        function()
          require("gitsigns").nav_hunk("next")
        end,
        desc = "Next git hunk"
      },
      {
        "[c",
        function()
          require("gitsigns").nav_hunk("prev")
        end,
        desc = "Previous git hunk"
      },
      {
        "<leader>hs",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "Stage hunk"
      },
      {
        "<leader>hr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "Reset hunk"
      },
      {
        "<leader>hp",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview hunk"
      },
      {
        "<leader>hb",
        function()
          require("gitsigns").blame_line()
        end,
        desc = "Blame hunk"
      },
    }
  }
}
