
return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20

        end,
        keys = {
            {'<leader>mi', ":MoltenInit<CR>", desc = "Initialize the kernel" },
            {'<leader>mr', ":MoltenReevaluateCell<CR>", desc = "Reevaluate cell" },
            {'<leader><Enter>', ":MoltenReevaluateCell<CR>", desc = "Reevaluate cell" },
            {'<leader>md', ":MoltenDelete<CR>", desc = "Delete cell" },
            {'<leader>ms', ":MoltenShowOutput<CR>", desc = "Show cell output" },
            {'<leader>mh', ":MoltenHideOutput<CR>", desc = "Hide cell output" },
            {'<leader>mv', ":MoltenEvaluateVisual<CR>", desc = "Evaluate visual block" },
            {'<leader>mo', ":MoltenEvaluateOperator<CR>", desc = "Evaluate operator" },
            {'<leader>ml', ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
            {'<leader>mI', ":MoltenInfo<CR>", desc = "Molten info" },
            {'<leader>mR', ":MoltenRestart<CR>", desc = "Restart kernel" },
        }
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
  --   {
  --       -- see the image.nvim readme for more information about configuring this plugin
  --       "3rd/image.nvim",
		-- config = function()
		-- 	require("image").setup()
		-- 	-- note: I removed redundant ';' from the ends of each path
		-- 	package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
		-- 	package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"
		-- end,
  --       opts = {
  --           backend = "ueberzug", -- whatever backend you would like to use
  --           max_width = 100,
  --           max_height = 12,
  --           max_height_window_percentage = math.huge,
  --           max_width_window_percentage = math.huge,
  --           window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  --           window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --       },
    -- }
}
