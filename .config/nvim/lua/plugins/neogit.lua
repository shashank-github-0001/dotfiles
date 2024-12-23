return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("neogit").setup({})
		vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", { desc = "Neogit Overview" })
	end,
}
