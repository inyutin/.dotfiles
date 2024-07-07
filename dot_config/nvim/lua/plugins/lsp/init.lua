local languages_all = require('plugins.lsp.languages.all')

local cmp_plugin = require('plugins.lsp.cmp')
local dap_plugin = require("plugins.lsp.dap")
local garbage_day_plugin = require("plugins.lsp.garbage_day")
local lsp_signature_plugin = require('plugins.lsp.lsp_signature')

--- @type LazyPluginSpec
local neoconf_plugin = {
  "folke/neoconf.nvim",
  opts = {}
}


--- @type LazyPluginSpec
local mason_plugin = {
  --- TODO: what else Mason can do, what other options are available?
  "williamboman/mason-lspconfig.nvim",
  opts = function()
    return {
      ensure_installed = languages_all.get_all_lsp_server_names(),
      automatic_installation = true,
    }
  end,
  lazy = true,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        enable = true,
        package_dir = vim.fn.stdpath("data") .. "/mason",
      },
    },
  }
}


--- @type LazyPluginSpec
local conform_plugin = {
  'stevearc/conform.nvim',
  config = function(_, _)
    require("conform").setup(languages_all.get_combined_conform_setup())
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}

--- @type LazyPluginSpec
local lsp_config_plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    neoconf_plugin,
    mason_plugin,
    cmp_plugin,
    conform_plugin,
  },
  opts = function()
    return {
      servers = languages_all.get_all_lsp_servers()
    }
  end,
  config = function(_, opts)
    local servers = opts.servers
    for server, server_opts in pairs(servers) do
      require("lspconfig")[server].setup(server_opts)
    end

    local signs = { Error = "", Warn = ' ', Hint = '', Info = ' ' }
    vim.diagnostic.config {
      virtual_text = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = true,
      },
    }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon,  texthl = hl, linehl = '', numhl = ''})
    end
  end,
}

--- @type LazyPluginSpec[]
return {
  conform_plugin,
  lsp_config_plugin,
  cmp_plugin,
  dap_plugin,
  garbage_day_plugin,
  lsp_signature_plugin,
}
