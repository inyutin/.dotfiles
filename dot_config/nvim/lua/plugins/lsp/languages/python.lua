local config = require('plugins.lsp.config')
local shared_on_attach = require('plugins.lsp.languages.shared.on_attach')

--- @return LspLanguage
local function get_python_language()
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local python_settings = config.get_python_settings()
  local function get_root_dir(startpath)
    local root_dir = python_settings.pyright.rootDir
    if root_dir ~= nil then
      return root_dir
    end
    for _, pattern in ipairs({ "pyrightconfig.json", "pyproject.toml" }) do
      root_dir = require("lspconfig").util.root_pattern(pattern)(startpath)
      if root_dir ~= nil then
        return root_dir
      end
    end
  end

  local pyright_python_settings = {
    analysis = python_settings.pyright.analysis,
  }
  if python_settings.pyright.pythonPath ~= nil then
    pyright_python_settings.pythonPath = python_settings.pyright.pythonPath
  end

  local black_extra_args = {}
  if python_settings.black.config_path ~= nil then
    table.insert(black_extra_args, "--config")
    table.insert(black_extra_args, python_settings.black.config_path)
  end

  local ruff_extra_args = {}
  if python_settings.ruff.config_path ~= nil then
    table.insert(ruff_extra_args, "--config")
    table.insert(ruff_extra_args, python_settings.ruff.config_path)
  end

  local null_ls = require("null-ls")

  --- @type LspLanguage
  local python_language = {
    lsp_servers = {
      pyright = {
        root_dir = get_root_dir,
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          python = pyright_python_settings,
        },
        on_attach = shared_on_attach,
      },
    },
    null_ls_sources = {
      -- formatting
      null_ls.builtins.formatting.black.with({
        extra_args = black_extra_args,
      }),
      -- -- diagnostics
      null_ls.builtins.diagnostics.ruff.with({
        extra_args = ruff_extra_args,
      })
    },
  }
  return python_language
end

return get_python_language
