#!/bin/bash
#sh scripts/tasks/create-task.sh
# date is in the YYYY-MM-DD format

curl "http://localhost:4741/tasks" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "task": {
      "name": "'"${NAME}"'",
      "category": "'"${CATEGORY}"'",
      "date": "'"${DATE}"'",
      "location": "'"${LOCATION}"'",
      "is_completed": "'"${IS_COMPLETED}"'",
      "description": "'"${DESCRIPTION}"'"
    }
  }'

echo
