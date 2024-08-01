local lsp_conf_defaults = {
  inlay_hints_enabled = false,
}
local function get_lsp_settings()
  local neoconf = require("neoconf")
  local lsp_settings = neoconf.get("lsp", lsp_conf_defaults)
  return lsp_settings
end

-- TODO: neoconf should be able to work with analysis/python parth params out of the box
local basedpyright_conf_defaults = {
  rootDir = nil,
  pythonPath = nil,
  analysis = {
    disableOrganizeImports = true, -- Using Ruff
    typeCheckingMode = "basic",
    diagnosticMode = "openFilesOnly",
    -- Based options
    reportUnreachable = true,
    reportUnsafeMultipleInheritance = true,
  },
}

local ruff_conf_defaults = {
  config_path = nil,
}


local python_conf_defaults = {
  ruff = ruff_conf_defaults,
  basedpyright = basedpyright_conf_defaults,
}

local function get_python_settings()
  local neoconf = require("neoconf")
  local python_settings = neoconf.get("python", python_conf_defaults)
  return python_settings
end

return {
  get_lsp_settings = get_lsp_settings,
  get_python_settings = get_python_settings,
}
