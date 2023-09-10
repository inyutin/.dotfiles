-- TODO: neoconf should be able to work with analysis/python parth params out of the box
local pyright_conf_defaults = {
	rootDir = nil,
	pythonPath = nil,
	analysis = {
		typeCheckingMode = "basic",
	},
}

local black_conf_defaults = {
	config_path = nil,
}

local ruff_conf_defaults = {
	config_path = nil,
}


local python_conf_defaults = {
	black = black_conf_defaults,
	ruff = ruff_conf_defaults,
	pyright = pyright_conf_defaults,
}

local function get_python_settings()
	Neoconf = require("neoconf")
	local python_settings = Neoconf.get("python", python_conf_defaults)
	return python_settings
end

return {
	get_python_settings = get_python_settings,
}
