return {
	{
		"olimorris/onedarkpro.nvim",

		priority = 1000,

		opts = {
      options = {
        transparency = true,
        terminal_colors = true,
      }
		},

		config = function(_, opts)
			require("onedarkpro").setup(opts)
      vim.cmd("colorscheme onedark")
		end,
	},
}
