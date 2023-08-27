local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch v10.3.0",
		lazypath,
	})
	print "lazy.nvim installed"
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {})
