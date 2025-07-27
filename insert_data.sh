#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OPPO_GOALS
do
  # for winners
  if [[ $WINNER != 'winner' ]]
  then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if id not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team
      INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_NAME='INSERT 0 1' ]]
      then
        echo Inserted in teams name: $WINNER
      fi
    
    # new id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi
 
  # for opponents
  if [[ $OPPONENT != 'opponent' ]]
  then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if id not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team
      INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_NAME='INSERT 0 1' ]]
      then
        echo Inserted in teams name: $OPPONENT
      fi
    
    # new id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi

  # filling games now
  if [[ $YEAR != 'year' ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    # insert into games
    INSERT_DATA_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR ,'$ROUND' ,$WINNER_ID ,$OPPONENT_ID ,$WIN_GOALS ,$OPPO_GOALS)")
    if [[ $INSERT_DATA_GAMES = 'INSERT 0 1' ]]
    then
      echo Inserted data in games
    fi
  fi
done