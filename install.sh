#!/bin/bash

set -eu

DOTPATH="${HOME}/dotfiles"

if [ ! -d "${DOTPATH}" ]; then
  git clone https://github.com/koyastick/dotfiles.git "${DOTPATH}"
else
  echo "${DOTPATH} already exists."
  cd "${DOTPATH}"
  git stash
  git pull origin master
fi

cd "${DOTPATH}"

# Create symlinks
for file in .??*; do
  [[ "${file}" == ".git" ]] && continue
  [[ "${file}" == ".gitignore" ]] && continue
  [[ "${file}" == ".DS_Store" ]] && continue
  [[ "${file}" == ".github" ]] && continue
  [[ "${file}" == ".vscode" ]] && continue
  ln -fvns "${DOTPATH}/${file}" "${HOME}/${file}"
done

echo "Setup done."