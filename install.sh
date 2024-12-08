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
mkdir -p ${HOME}/.config
for file in .??* .config/*; do
  [[ "${file}" == ".git" ]] && continue
  [[ "${file}" == ".gitignore" ]] && continue
  [[ "${file}" == ".DS_Store" ]] && continue
  [[ "${file}" == ".github" ]] && continue
  [[ "${file}" == ".vscode" ]] && continue
  if [ -e "${HOME}/${file}" ]; then
      echo "${HOME}/${file} is existing. Skip."
      continue;
  else
      ln -fvns "${DOTPATH}/${file}" "${HOME}/${file}"
  fi
done

# Install plugins managers
## Install zplug
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
## Install Tmux Plugin Manager, TPM
if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
## Install vim-plug
if [ ! -e  "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Others
## initial compile .zshrc
zcompile ~/.zshrc

echo "Setup done."
