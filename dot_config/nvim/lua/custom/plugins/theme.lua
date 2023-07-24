return {
    'nvim-tree/nvim-web-devicons',
    config = function()
        require('onedark').setup { --depends on init.lua containing "onedark"
            style = 'warmer',
            transparent = true,
            ending_tildes = true,
            highlights = {
                ['IndentBlanklineChar'] = { fg = '$bg3', fmt = "nocombine" },
                ['IndentBlanklineContextChar'] = { fg =  '$grey', fmt = "nocombine" },
                ['IndentBlanklineContextStart'] = { sp = '$grey', fmt = "underline" },
            },
            toggle_style_key = "<leader>ts",
            toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
        }
        require('onedark').load()
    end,
}
