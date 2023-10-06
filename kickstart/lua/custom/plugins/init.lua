-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- { "tjdevries/templ.nvim",    lazy = false },
	{ "nvim-tree/nvim-tree.lua", lazy = false },
	{ 'ThePrimeagen/harpoon' }
	, {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
}
