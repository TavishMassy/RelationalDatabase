#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUM=$((1 + RANDOM % 100))

USER_HISTORY() {
  echo "Enter your username:"
  read USERNAME
  
}

MAIN() {
  USER_HISTORY
}

MAIN
