#!/bin/bash

file=$(dirname $(realpath "$0"))/.env
if [ -f "$file" ]; then
    echo ".env already exist."
else
    touch "$file"
    echo 'PROJECT_NAME=notes' >> "$file"
    echo '#php-fpm' >> "$file"
    echo 'USER_ID='$(id -u) >> "$file"
    echo 'GROUP_ID='$(id -g) >> "$file"
    echo '#db' >> "$file"
    echo 'PASSWORD_DB=''' >> "$file"
fi
