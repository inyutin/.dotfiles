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
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    })
    require("conform.formatters.ruff_format").args = {
      "format",
      "--config",
      "/home/dmitry/Code/fuse/python_monorepo/pyproject.toml",
      "--stdin-filename",
      "$FILENAME",
      "-",
    }
    require("conform").setup({
      format_on_save = {
        async = true,
        quiet = true,
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}

local null_ls_plugin = {
  "jose-elias-alvarez/null-ls.nvim",
  config = function(_, _)
    -- Null_ls is used for diagnostics only
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = languages_all.get_all_null_ls_sources(),
    })
  end,
}

--- @type LazyPluginSpec
local lsp_config_plugin = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    neoconf_plugin,
    mason_plugin,
    cmp_plugin,
    conform_plugin,
    null_ls_plugin,
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
