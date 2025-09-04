let carapace_completer = {|spans|
  carapace $spans.0 nushell ...$spans | from json
}

let completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)

    let spans = (if $expanded_alias != null  {
      $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
    } else {
      $spans
    })

    match $spans.0 {
        _ => $carapace_completer
    } | do $in $spans
}


$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: $completer
}
