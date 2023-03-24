return {
    'nvim-tree/nvim-web-devicons',
    config = function()
        require('onedark').setup { --depends on init.lua containing "onedark"
            style = 'warmer',
            transparent = true
        }
        require('onedark').load()
    end,
}
