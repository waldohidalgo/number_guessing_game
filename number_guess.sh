#!/bin/bash

$SECRET_NUMBER=$(((RANDOM % 1000) + 1))

echo "Enter your username:"

READ USERNAME

if [[ -z $USERNAME ]]; then
    echo "Error: Username cannot be empty"
else
    SEARCH_USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
    
fi