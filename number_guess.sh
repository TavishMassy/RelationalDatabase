#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
GUESSES=0
RANDOM_NUM=$((1 + RANDOM % 1000))

MAIN() {
  echo "Enter your username:"
  read USERNAME
  USER_INFO=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
  if [[ -z $USER_INFO ]]
  then
    CREAT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    echo "$USER_INFO" | while IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME
    do
      USERNAME=$(echo "$USERNAME" | xargs)
      GAMES_PLAYED=$(echo "$GAMES_PLAYED" | xargs)
      BEST_GAME=$(echo "$BEST_GAME" | xargs)
      echo "Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses."
    done
  fi
  echo "Guess the secret number between 1 and 1000:"
  GAME_MAIN 
}

GAME_MAIN() {
  read GUESS_NUM
  if [[ $GUESS_NUM =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS_NUM -lt $RANDOM_NUM ]]
    then
      let GUESSES+=1
      echo "It's lower than that, guess again:"
      GAME_MAIN
    elif [[ $GUESS_NUM -gt $RANDOM_NUM ]]
    then
      let GUESSES+=1
      echo "It's higher than that, guess again:"
      GAME_MAIN
    else
      let GUESSES+=1
      SAVE_GAME_INFO
      echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUM."
    fi
  else
    echo "That is not an integer, guess again:"
    GAME_MAIN
  fi
}

SAVE_GAME_INFO() {
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  let GAMES_PLAYED+=1
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  if [[ $GUESSES -lt $BEST_GAME ]]
  then
    INSERT_IN_USERS=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $GUESSES WHERE username = '$USERNAME'")
  else
    INSERT_IN_USERS=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'")
  fi
}


MAIN 
