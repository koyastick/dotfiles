#!/bin/bash

set -eu

DOTPATH="${HOME}/dotfiles"

if [ ! -d "${DOTPATH}" ]; then
  git clone https://github.com/koyastick/dotfiles.git "${DOTPATH}"
else
  echo "${DOTPATH} already exists."
  cd "${DOTPATH}"
  git stash
  git pull origin main
fi

cd "${DOTPATH}"

# Create symlinks
for file in .??*; do
  [[ "${file}" == ".git" ]] && continue
  [[ "${file}" == ".gitignore" ]] && continue
  [[ "${file}" == ".DS_Store" ]] && continue
  [[ "${file}" == ".github" ]] && continue
  [[ "${file}" == ".vscode" ]] && continue
  if [ -e "$file" ]; then
      echo "$file is existing. Skip."
      continue;
  else
      echo "Creating symlink for $file"
      ln -fvns "${DOTPATH}/${file}" "${HOME}/${file}"
  fi
done

if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Creating ~/.config/nvim"
    mkdir -p "$HOME/.config/nvim"
fi
target=${DOTPATH}/.config/nvim/init.vim
echo "Creating symlink for $target"
ln -fvns "$target" "${HOME}/.config/nvim/init.vim"

# Install plugins managers
## Install zplug
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

## Install vim-plug
if [ ! -e  "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

echo "Setup done."