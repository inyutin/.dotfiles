let carapace_completer = {|spans|
  # if the current command is an alias, get it's expansion
  let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)

  # overwrite
  let spans = (if $expanded_alias != null  {
    # put the first word of the expanded alias first in the span
    $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
  } else {
    $spans
  })

  carapace $spans.0 nushell ...$spans
  | from json
}

let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}

let completer = {|spans|
    match $spans.0 {
        z => $zoxide_completer
        zi => $zoxide_completer
        _ => $carapace_completer
    } | do $in $spans
}


$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: $completer
}
