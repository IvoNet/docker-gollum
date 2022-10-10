#!/usr/bin/env bash

echo "Initializing git configuration."

cd /wiki || exit 1

# check with git if directory is a git directory

if [ -z "${GIT_USER}" ]; then
    echo "Using default git user name and email."
    GIT_USER_NAME="Gollum"
    echo "you should define your own user by adding GIT_USER to the environment"
else
    echo "Using user defined in GIT_USER."
    GIT_USER_NAME="${GIT_USER}"
fi

if [ -z "${GIT_EMAIL}" ]; then
    echo "Using default git user email."
    GIT_USER_EMAIL="gollum@localhost"
    echo "You should define your own email by adding GIT_EMAIL to the environment"
else
    echo "Using user defined in GIT_EMAIL."
    GIT_USER_EMAIL="${GIT_EMAIL}"
fi

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"
git config --global init.defaultBranch "master"
git config --global --bool core.bare true

if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Git directory found."
else
    echo "Git directory not found."
    echo "Initializing git configuration."
    git init --bare
    echo "Git directory initialized."
    echo "Can add this repository as are remote origin with:"
    echo "$ git remote add origin <location of the repository>"
fi

git config --global --add safe.directory /wiki

/usr/bin/gollum --port 8080 --emoji --allow-uploads page --h1-title --css --js --bare --config /config.rb /wiki
