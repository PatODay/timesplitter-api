#!/bin/bash
#sh scripts/tasks/show-task.sh

curl "http://localhost:4741/tasks/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
