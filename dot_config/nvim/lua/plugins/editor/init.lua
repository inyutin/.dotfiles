local bqf_plugin = require("plugins.editor.bqf")
local comment_plugin = require("plugins.editor.comment")
local copilot_plugin = require("plugins.editor.copilot")
local flash_plugin = require("plugins.editor.flash")
local illuminate_plugin = require("plugins.editor.illuminate")
local multiple_cursors_plugin = require("plugins.editor.multiple_cursors")
local various_textobjs = require("plugins.editor.various_textobjs")

--- @type LazyPluginSpec[]
return {
  bqf_plugin,
  comment_plugin,
  copilot_plugin,
  flash_plugin,
  illuminate_plugin,
  multiple_cursors_plugin,
  various_textobjs,
}
