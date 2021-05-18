#/bin/bash
set -ex

check_command_exists () {
    if ! command -v $1 &> /dev/null
    then
        echo "$1 could not be found"
        exit
    fi
}

download_from_pre_commit_configs_repo () {
    curl https://raw.githubusercontent.com/hardianlawi/pre-commit-configs/main/$1 > $1
}

download_configs () {
    download_from_pre_commit_configs_repo .pre-commit-config.yaml
    download_from_pre_commit_configs_repo .flake8
    download_from_pre_commit_configs_repo .isort.cfg
    download_from_pre_commit_configs_repo .pyproject.toml
}

check_command_exists curl
check_command_exists pre-commit
download_configs

pre-commit autoupdate
pre-commit install