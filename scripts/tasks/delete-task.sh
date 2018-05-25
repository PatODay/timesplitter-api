#!/bin/bash
#sh scripts/tasks/delete-task.sh

curl "http://localhost:4741/tasks/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}"

echo
