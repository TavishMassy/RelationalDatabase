#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
GUESSES=0
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

GAME_MAIN() {
  echo "Guess the secret number between 1 and 1000:"
  read GUESS_NUM
  if [[ $GUESS_NUM =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS_NUM < $RANDOM_NUM ]]
    then
      $GUESSES += 1
      echo "It's lower than that, guess again:"
    elif [[ $GUESS_NUM > $RANDOM_NUM ]]
    then
      $GUESSES += 1
      echo "It's higher than that, guess again:"
    else
      $GUESSES += 1
      You guessed it in $GUESSES tries. The secret number was $RANDOM_NUM.
    fi
  else
    echo "That is not an integer, guess again:"
  fi
}

MAIN() {
  USER_HISTORY
}

MAIN
