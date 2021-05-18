#/bin/bash
set -ex

check_command_exists () {
    if ! command -v $1 &> /dev/null
    then
        echo "$1 could not be found"
        exit
    fi
}

download_configs () {
    wget -c https://raw.githubusercontent.com/hardianlawi/pre-commit-configs/main/.pre-commit-config.yaml
    wget -c https://raw.githubusercontent.com/hardianlawi/pre-commit-configs/main/.flake8
    wget -c https://raw.githubusercontent.com/hardianlawi/pre-commit-configs/main/.isort.cfg
    wget -c https://raw.githubusercontent.com/hardianlawi/pre-commit-configs/main/pyproject.toml
}

check_command_exists wget
check_command_exists pre-commit
download_configs

pre-commit autoupdate
pre-commit install