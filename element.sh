#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
fi
