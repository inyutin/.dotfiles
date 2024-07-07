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

  local ruff_extra_args = {}
  if python_settings.ruff.config_path ~= nil then
    table.insert(ruff_extra_args, "--config")
    table.insert(ruff_extra_args, python_settings.ruff.config_path)
  end

  local _unpack = unpack or table.unpack

  --- @type LspLanguage
  local python_language = {
    lsp_servers = {
      pyright = {
        root_dir = get_root_dir,
        on_attach = shared_on_attach,
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          pyright = {
            disableOrganizeImports = true, -- Using Ruff
          },
          python = pyright_python_settings,
        },
      },
      ruff_lsp = {
        root_dir = get_root_dir,
        on_attach = shared_on_attach,
        capabilities = capabilities,
        filetypes = { "python" },
        init_options = {
          settings = {
            args = ruff_extra_args,
          }
        }
      },
    },
    conform_setup = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix" },
      },
      formatters = {
        ruff_format = {
          args = {
            "format",
            "--stdin-filename",
            "$FILENAME",
            "-",
            _unpack(ruff_extra_args),
          }
        },
        ruff_fix = {
          args = {
            "check",
            "--fix",
            "--stdin-filename",
            "$FILENAME",
            "-",
            _unpack(ruff_extra_args),
          }
        }
      }
    },
  }
  return python_language
end

return get_python_language
