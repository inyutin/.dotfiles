$env.PYENV_ROOT = "~/.pyenv"
$env.PYENV_SHELL = "nu"
$env.PATH = ($env.PATH | split row (char esep) | prepend $"(pyenv root)/shims")
