local bqf_plugin = require("plugins.editor.bqf")
local comment_plugin = require("plugins.editor.comment")
local copilot_plugin = require("plugins.editor.copilot")
local flash_plugin = require("plugins.editor.flash")
local grug_far_plugin = require("plugins.editor.grug_far")
local illuminate_plugin = require("plugins.editor.illuminate")
local multiple_cursors_plugin = require("plugins.editor.multiple_cursors")
local precognition_plugin = require("plugins.editor.precognition")
local various_textobjs = require("plugins.editor.various_textobjs")

--- @type LazyPluginSpec[]
return {
	bqf_plugin,
	comment_plugin,
	copilot_plugin,
	flash_plugin,
	grug_far_plugin,
	illuminate_plugin,
	multiple_cursors_plugin,
	precognition_plugin,
	various_textobjs,
}
