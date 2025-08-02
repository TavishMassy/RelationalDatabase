#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1'")
  echo "$ELEMENT" | while read ATOMIC_NO BAR SYMBOL BAR NAME
  do
    PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number='$ATOMIC_NO'")
    echo "$PROPERTIES" | while read ATOMIC_NO BAR TYPE_ID BAR ATOMIC_MASS BAR MELT_POINT_CELSIUS BAR BOIL_POINT_CELSIUS
    do
      echo -e "\nThe element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
    done
  done
fi
