-- DAP(debug) related plugins
return {
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    'David-Kunz/jester',
    dependencies = {
        'mfussenegger/nvim-dap'
    },  


    config = function()
        -- Enable virtual text for dap
        require("nvim-dap-virtual-text").setup()

        -- dapui setup -- custom layouts 
        require("dapui").setup()

        -- automatically open/close dapui when dap actions occur 
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        end

        vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})

        -- debug toggle mappings 
        vim.keymap.set('n', "<F4>", require('dapui').toggle, { desc = 'toggle dapui (default layout)' })
        vim.keymap.set('n', "<F5>", require('dap').toggle_breakpoint, { desc = 'toggle breakpoint' })

        -- debug actions mappings  
        vim.keymap.set('n', "<F9>", require('dap').continue, { desc = 'debug - continue' })
        vim.keymap.set('n', "<F1>", require('dap').step_over, { desc = 'debug - step over' })
        vim.keymap.set('n', "<F2>", require('dap').step_into, { desc = 'debug - step into' })
        vim.keymap.set('n', "<F3>", require('dap').step_out, { desc = 'debug - step out' })

        -- debug actions mappings - phonetics
        vim.keymap.set('n', "<Leader>dbp", require('dap').toggle_breakpoint, { desc = '[D]ebug - toggle [B]reak[P]oint' })
        vim.keymap.set('n', "<Leader>dsc", require('dap').continue, { desc = '[D]ebug - [S]tep [C]ontinue' })
        vim.keymap.set('n', "<Leader>dsv", require('dap').step_over, { desc = '[D]ebug - [S]tep o[V]er'})
        vim.keymap.set('n', "<Leader>dsi", require('dap').step_into, { desc = '[D]ebug - [S]tep [I]nto' })
        vim.keymap.set('n', "<Leader>dso", require('dap').step_out, { desc = '[D]ebug - [S]tep [O]ut' })

        -- dap-python
        require('dap-python').setup('/usr/bin/python')
        require('dap-python').test_runner = 'unittest'
        vim.keymap.set('n', '<leader>df', require('dap-python').test_class, { desc = 'Python - Test Class' })
        vim.keymap.set('n', '<leader>dn', require('dap-python').test_method, { desc = 'Python - Test Method' })
        -- dap adapters 
        require('dap').adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = {os.getenv('HOME') ..'/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
        }

        -- dap configurations
        require('dap').configurations.javascript = {
            {
                name = 'Launch',
                type = 'node2',
                request = 'launch',
                program = '${file}',
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = 'inspector',
                co00nsole = 'integratedTerminal',
            },
            {
                -- For this to work you need to make sure the node process is started with the `--inspect` flag.
                name = 'Attach to process',
                type = 'node2',
                request = 'attach',
                processId = require'dap.utils'.pick_process,
            },
        }
    end,
}