# API for TimeSplitter: Task Tracking App v 0.1.3

[TimeSplitter Deployed Site](https://patoday.github.io/timesplitter-ember-client/)
[TimeSplitter Front End Repo](https://github.com/PatODay/timesplitter-ember-client)

TimeSplitter is designed to allow registered users to input tasks they need and/or want to do. All authenticated users tasks are tied with the email they used to create the account and will be visible to them and only them.

# Technologies Used

### Backend
  * Ruby on Rails

### Front End
  * Ember.js
  * JavaScript
  * AJAX
  * HTML
  * GitHub
  * Atom
  * CSS/SASS
  * Bootstrap
  * Handlebars
  * Bash/Terminal
  * Google Chrome

# TimeSplitter API Deployed Link

  * [TimeSplitter Heroku Page](https://dry-hollows-29032.herokuapp.com/)

# API Endpoints

## Authentication
Curl Scripts can be found in scripts/auth
All data returned from API actions is formatted as JSON.

| Verb          | URI                   | Controller#Action    |
| :-----------: |:---------------------:| :-------------------:|
| POST          | `/sign-up`            |     `users#signup`   |
| POST          | `/sign-in`            |     `users#signin`   |
| DELETE        | `/sign-out`           |     `users#signout`  |
| PATCH/PUT     | `/change-password`    |     `users#changepw` |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/auth/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/auth/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/

Request:

```sh
curl "http://localhost:4741/change-password" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "new example"
    }
  }'
```

```sh
TOKEN=< auth token > scripts/auth/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/ \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/auth/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
## Tasks
Curl Scripts can be found in scripts/tasks. Date is in the YYYY-MM-DD format
All data returned from API actions is formatted as JSON.

| Verb          | URI                   | Controller#Action    |
| :-----------: |:---------------------:| :-------------------:|
| GET           | `/tasks`              |     `tasks#index`    |
| DELETE        | `/tasks/:id`          |     `tasks#destroy`  |
| POST          | `/tasks`              |     `tasks#create`   |
| PATCH/PUT     | `/tasks/:id`          |     `tasks#update`   |

#### POST /tasks
Date is in the YYYY-MM-DD format

Request:

```sh
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
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa NAME='example name' TEXT='task text' CATEGORY="example category" DATE="YYYY-MM-DD" LOCATION="example location" IS_COMPLETED=true DESCRIPTION="example description" sh scripts/tasks/create-task.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "task": {
  "name": "example name",
  "category": "example category",
  "date": "YYYY-MM-DD",
  "location": "example location",
  "is_completed": "true",
  "description": "example description"
  }
}
```

#### GET /tasks

Request:

```sh
curl "http://localhost:4741/tasks" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa sh scripts/tasks/get-tasks.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "task": {
    "id": 0,
    "name": "something",
    "text": "something else"
  },
  "task": {
    "id": 1,
    "name": "task name",
    "text": "task text"
  }
}
```

#### GET /tasks/:id

Request:

```sh
curl "http://localhost:4741/tasks/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa ID=0 sh scripts/tasks/show-task.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "task": {
    "id": 0,
    "name": "something",
    "text": "something else"
  }
}
```

#### PATCH `/tasks/:id`

Request:

```sh
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
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa ID=2 NAME="updated example name" TEXT="updated task text" CATEGORY="updated example category" DATE="YYYY-MM-DD" LOCATION="updated example location" IS_COMPLETED=true DESCRIPTION="updated example description"  sh scripts/tasks/update-task.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "task": {
    "id": 2,
    "name": "updated example name",
    "category": "updated example category",
    "date": "YYYY-MM-DD",
    "location": "updated example location",
    "is_completed": "true",
    "description": "updated example description"
  }
}
```

#### DELETE `/tasks/:id`

Request:

```sh
curl "http://localhost:4741/tasks/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa ID=2 sh scripts/tasks/delete-task.sh
```

Response:

```md
HTTP/1.1 204 NO CONTENT
Content-Type: application/json; charset=utf-8
```

# Wireframes & ERD

[Wireframes & ERD](https://i.imgur.com/KCWxGXA.jpg)

# Images

![alt text](https://i.imgur.com/th7WSdv.png)
![alt text](https://i.imgur.com/YXAlkYG.png)
![alt text](https://i.imgur.com/5IW7tJd.png)

# Setup and Installation

If you wish to contribute to this repo:
1. Fork and clone this repo
2. Install dependencies with `bundle install`
