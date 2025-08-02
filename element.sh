#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

ELEMENT_INFO() {
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  echo "$ELEMENT" | while read ATOMIC_NO BAR SYMBOL BAR NAME
  do
    PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number='$ATOMIC_NO'")
    echo "$PROPERTIES" | while read ATOMIC_NO BAR TYPE_ID BAR ATOMIC_MASS BAR MELT_POINT_CELSIUS BAR BOIL_POINT_CELSIUS
    do
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
      echo -e "\nThe element with atomic number $ATOMIC_NO is $NAME ($SYMBOL). It's a$TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT_CELSIUS celsius and a boiling point of $BOIL_POINT_CELSIUS celsius."
    done
  done
}

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  NAME_SYM="$1"
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$NAME_SYM' OR name='$NAME_SYM'")
  if [[ -z $ELEMENT ]]
  then
    
  fi
fi
