#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUM=$((1 + RANDOM % 100))

USER_HISTORY() {
  echo "Enter your username:"
  read USERNAME
  USER_INFO=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
  if [[ -z $USER_INFO ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    CREAT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  else
    echo "$USER_INFO" | while read UID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
}



MAIN() {
  USER_HISTORY
}

MAIN
