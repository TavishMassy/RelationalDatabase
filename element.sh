#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1'")
  echo "$ELEMENT" | while read ATOMIC_NO BAR SYMBOL BAR NAME
  do
    PROPERTY=$($PSQL "SELECT * FROM properties WHERE atomic_number='$ATOMIC_NO'")
    echo ""
  done
fi
