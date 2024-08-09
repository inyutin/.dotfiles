$env.PYENV_ROOT = "pyenv"
$env.PATH = ($env.PATH | split row (char esep) | prepend $"(pyenv root)/shims")
