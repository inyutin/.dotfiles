local dapui_settings = {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 1.0
        },
      },
      position = "left",
      size = 40
    },
    {
      elements = {
        {
          id = "watches",
          size = 0.75
        },
        {
          id = "breakpoints",
          size = 0.25
        },
      },
      position = "right",
      size = 20
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5
        },
        {
          id = "console",
          size = 0.5
        }
      },
      position = "bottom",
      size = 10
    }
  },
}

--- @type LazyPluginSpec
local dap_plugin = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "LiadOz/nvim-dap-repl-highlights",
    -- For specific languages
    {
      "mfussenegger/nvim-dap-python",
      commit = "66560f0ebddf96604f7037e1efad3ba6942761e6"
    }
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup(dapui_settings)
    require("nvim-dap-virtual-text").setup(
    -- TODO Nvim 0.10:
    -- virt_text_pos
    )
    require('nvim-dap-repl-highlights').setup()

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dc", dap.run_to_cursor)
    vim.keymap.set("n", "<leader>dr", dap.clear_breakpoints)

    -- Eval var under cursor
    vim.keymap.set("n", "<leader>d?", function()
      dapui.eval(nil, { enter = true })
    end)

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F13>", dap.restart)

    local nvim_tree_api = require('nvim-tree.api')
    dap.listeners.before.attach.dapui_config = function()
      nvim_tree_api.tree.close()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      nvim_tree_api.tree.close()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Python
    local dap_python = require("dap-python")
    dap_python.setup("~/.virtualenvs/debugpy/bin/python") -- TODO: create this automatically
    dap_python.test_runner = 'pytest'

    vim.keymap.set('n', '<leader>dm', dap_python.test_method)
  end,
}
return dap_plugin
