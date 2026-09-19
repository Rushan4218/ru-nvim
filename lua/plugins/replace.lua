return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = {
      "GrugFar",
      "GrugFarWithin",
    },
    keys = {
      {
        "<leader>R",
        function()
          require("grug-far").open()
        end,
        desc = "Search and replace (project)"
      },
      {
        "<leader>r",
        function()
          require("grug-far").open({
            prefills = {
              paths = vim.fn.expand("%"),
            }
          })
        end,
        desc = "Search and replace (file)"
      }
    }
  }
}
