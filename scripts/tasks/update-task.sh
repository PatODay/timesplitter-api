#!/bin/bash
#sh scripts/tasks/update-task.sh
# date is in the YYYY-MM-DD format

curl "http://localhost:4741/tasks/${ID}" \
  --include \
  --request PATCH \
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
