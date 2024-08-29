alias v = nvim .

# Chezmoi Update: forget all files and add them back
def cz-upd [path: path = .] {
  do -i {chezmoi forget --force $path } ; chezmoi add $path
}

### gpt-cli
alias text-improve = gpt text-improver

def translate [
  text?: string
] {
  gpt translator -p $text
}

alias se = gpt software-engineer

###

### Git

# Checkout main branch and pull
def main [] {
  git checkout main;
  git pull;
}

# Checkout a new branch from main
def new-branch [branch: string] {
  main;
  git checkout -b $branch
}

def _git_recent_branches [] {
  return (
    git branch -l --sort=-committerdate | lines
    | each {|value| {"value": ($value | str trim --char '*' | str trim )} }
  )
}

# Rebase (branch?) on updated main branch
def re-branch [branch?: string@_git_recent_branches] {
  mut $b = $branch
  if $b == null {
    $b = (git branch --show-current);
  }
  main;
  git checkout $b
  git rebase main
}

alias grb = re-branch

def git-clean [] {
  # https://github.com/nushell/nu_scripts/blob/430951c3b17a38bfabdd7e34f714a8616b830ddf/sourced/cool-oneliners/git_gone.nu
  git branch --merged | lines | where $it !~ '\*' | str trim | where $it != 'master' and $it != 'main' | each { |it| git branch -d $it }
  git prune
}

###
