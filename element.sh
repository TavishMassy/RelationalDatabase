#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"


MAIN() {
  if [[ -z $1 ]]
  then
    echo -e "Please provide an element as an argument."
  elif [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    CHECK_N_CONTINUE $ELEMENT
  else
    ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
    CHECK_N_CONTINUE $ELEMENT
  fi
}


CHECK_N_CONTINUE() {
  if [[ -z $1 ]]
  then
    echo "I could not find that element in the database."
  else
    ELEMENT_INFO $1
  fi
}


ELEMENT_INFO() {
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  echo "$ELEMENT" | while read ATOMIC_NO BAR SYMBOL BAR NAME
  do
    PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number='$ATOMIC_NO'")
    echo "$PROPERTIES" | while read ATOMIC_NO BAR TYPE_ID BAR ATOMIC_MASS BAR MELT_POINT_CELSIUS BAR BOIL_POINT_CELSIUS
    do
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
      echo "The element with atomic number $ATOMIC_NO is $NAME ($SYMBOL). It's a$TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT_CELSIUS celsius and a boiling point of $BOIL_POINT_CELSIUS celsius."
    done
  done
}


MAIN $1
