alias v = nvim .

# Chezmoi Update: forget all files and add them back
def cz-upd [path: path = .] {
  do -i {chezmoi forget --force $path } ; chezmoi add $path
}
