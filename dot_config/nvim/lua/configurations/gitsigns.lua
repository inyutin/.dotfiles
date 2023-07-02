local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
		vim.notify("Gitsigns is not installed!", vim.log.levels.ERROR)	
  return
end

gitsigns.setup {}
