#!/bin/bash

$SECRET_NUMBER=$(((RANDOM % 1000) + 1))

echo "Enter your username:"

READ USERNAME

if [[ -z $USERNAME ]]; then
    echo "Error: Username cannot be empty"
else
    SEARCH_USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
    if [[ -z $SEARCH_USERNAME ]]; then
        echo "Welcome, $USERNAME! It looks like this is your first time here."
    else
        QUERY_GAMES=$($PSQL "SELECT count(*), MIN(games_played) FROM games INNER JOIN users ON games.user_id=users.user_id WHERE username='$USERNAME'")
        echo "$QUERY_GAMES" | while IFS="|" read GAMES_PLAYED BEST_SCORE; do
            echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
        done
        
    fi
fi