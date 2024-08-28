$env._direnv_hook_enabled = true

def --env direnv-hook [] {
  direnv export json | from json | default {} | load-env
}

$env.config = ($env.config | upsert hooks {
    pre_prompt: { ||
      if (which direnv | is-empty) {
        return
      }
      if $env._direnv_hook_enabled {
        direnv-hook
      }
    }
})

# Toggle direnv, based on https://github.com/direnv/direnv/issues/260

def --env direnv-toggle [] {
  if $env._direnv_hook_enabled {
    let pwd = $env.pwd
    cd /dev
    $env._direnv_hook_enabled = false
    direnv-hook
    cd $pwd
  } else {
    $env._direnv_hook_enabled = true
    direnv-hook
  }
}
