#!/bin/zsh

## brew install pyenv
if ! grep -q "eval \"$(pyenv init --path)\"" ~/.zshrc; then
    echo "eval \"$(pyenv init --path)\"" >> ~/.zshrc
fi

if ! grep -q "eval \"$(pyenv init -)\"" ~/.zshrc; then
    echo "eval \"$(pyenv init -)\"" >> ~/.zshrc
fi

## brew install pyenv-virtualenv
if ! grep -q "eval \"$(pyenv virtualenv-init -)\"" ~/.zshrc; then
    echo "eval \"$(pyenv virtualenv-init -)\"" >> ~/.zshrc
fi

# shellcheck disable=SC1090
source ~/.zshrc