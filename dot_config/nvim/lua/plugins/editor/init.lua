local comment_plugin = require("plugins.editor.comment")
local flash_plugin = require("plugins.editor.flash")
local illuminate_plugin = require("plugins.editor.illuminate")

--- @type LazyPluginSpec[]
return {
	comment_plugin,
	flash_plugin,
	illuminate_plugin,
}
