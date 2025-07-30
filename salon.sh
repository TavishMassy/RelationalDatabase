#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  echo -e "\n~~~~~ MY SALON ~~~~~\n"
  echo -e "Welcome to My Salon."
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  echo -e "\nSelect a service to book an appointment:"
  read SERVICE_ID_SELECTED
  APPOINTMENT_MENU "$SERVICE_ID_SELECTED"
}


APPOINTMENT_MENU() {
  SERVICE_ID_SELECTED=$1
  CHOSEN_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $CHOSEN_SERVICE ]]
  then 
    echo -e "Please select valid option.\n"
    MAIN_MENU
    return
  else
    echo "You chose $SERVICE_ID_SELECTED)$CHOSEN_SERVICE"
    echo -e "\nPlease enter your contact no."
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nWhat is your name?"
      read CUSTOMER_NAME
      INSERT_INTO_CUSTOMERS=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")

      echo -e "\nWhat time do you want to book an appointmemt?"
      read SERVICE_TIME
      INSERT_INTO_APPOINTMENTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a$CHOSEN_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."     
    fi
  fi
}

MAIN_MENU

