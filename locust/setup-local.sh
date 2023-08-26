#!/bin/bash

VERSION=$(cat "./.python-version")

# shellcheck disable=SC2086
pyenv local $VERSION

# shellcheck disable=SC2086
pyenv virtualenv $VERSION venv && pyenv activate venv

pip install -r requirements.txt