#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a package name."
    exit 1
fi


if dpkg -l | grep -qw "$1"; then
    echo "Package '$1' is installed."
    read -p "Are you sure you want to remove the package '$1'? (y/n): " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo "Removing package '$1'..."
        sudo apt purge -y "$1"
    else
        echo "Aborted removal of package '$1'."
    fi
else
    echo "Package '$1' is not installed."
fi
