#!/bin/bash
# TODO: Make state persistent so that we can check to see whether people are actively clearing suggestions
if [ $# -eq 0 ]
then
# No arguments supplied
THRESHOLD=5
else
THRESHOLD=$1
fi
NUM_SUGGESTIONS=`mysql -u mapping -p$(cat /home/jbkuszmaul/MYSQL_PASSWORD) bikemap < suggestions.sql 2>/dev/null | grep "[0-9]\+" | awk '{s+=$1} END {print s}'`
echo $NUM_SUGGESTIONS
if [ $NUM_SUGGESTIONS -gt $THRESHOLD ]
then
echo "Sending mail"
echo "There are $NUM_SUGGESTIONS suggested items awaiting approval" | mail -s "[CRON] Bikemap Suggestions" "bikemap@wpi.edu"
fi
