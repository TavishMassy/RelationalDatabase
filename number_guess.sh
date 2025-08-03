#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
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
    echo "$USER_INFO" | while read USER_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
}

GAME_MAIN() {
  echo "Guess the secret number between 1 and 100:"
  read GUESS_NUM
  if [[ $GUESS_NUM =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS_NUM < $RANDOM_NUM ]]
    then
      let GUESSES+=1
      echo "It's lower than that, guess again:"
      GAME_MAIN
    elif [[ $GUESS_NUM > $RANDOM_NUM ]]
    then
      let GUESSES+=1
      echo "It's higher than that, guess again:"
      GAME_MAIN
    else
      let GUESSES+=1
      echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUM."
      SAVE_GAME_INFO $GUSSES
    fi
  else
    echo "That is not an integer, guess again:"
    GAME_MAIN
  fi
}

SAVE_GAME_INFO() {
  let GAMES_PLAYED+=1
  $BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  if [[ $1 < $BEST_GAME ]]
  then
    INSERT_IN_USERS=$($PSQL "INSERT INTO users(games_played, best_game) VALUES($GAMES_PLAYED, $1) WHERE username='$USERNAME'")
  else
    INSERT_IN_USERS=$($PSQL "INSERT INTO users(games_played) VALUES($GAMES_PLAYED) WHERE username='$USERNAME'")
  fi
}


USER_HISTORY
GAME_MAIN  
