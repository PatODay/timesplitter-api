#!/bin/bash
#sh scripts/tasks/get-tasks

curl "http://localhost:4741/tasks" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
