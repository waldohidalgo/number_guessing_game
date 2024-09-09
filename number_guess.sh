#!/bin/bash

GUESS_NUMBER() {
    USERNAME=$1
    echo "Guess the secret number between 1 and 1000:"
    NUMBER_OF_GUESSES=0
    read NUMBER_INPUT
    while [[ ! $NUMBER_INPUT =~ ^[0-9]+$ ]]; do
        echo "That is not an integer, guess again:"
        read NUMBER_INPUT
        NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
    done
    while [[ $NUMBER_INPUT -ne $SECRET_NUMBER ]]; do
        if [[ $NUMBER_INPUT -lt $SECRET_NUMBER ]]; then
            echo "It's higher than that, guess again:"
        else
            echo "It's lower than that, guess again:"
        fi
        read NUMBER_INPUT
        NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
        while [[ ! $NUMBER_INPUT =~ ^[0-9]+$ ]]; do
            echo "That is not an integer, guess again:"
            read NUMBER_INPUT
            NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
        done
    done
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, games_played, number_guess) VALUES((SELECT user_id FROM users WHERE username='$USERNAME'), $NUMBER_OF_GUESSES, $SECRET_NUMBER)")
}

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