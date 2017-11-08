# Sserpdrow-API
About: The Sserpdrow API is used by the front-end application for the storage of Site records for individual users.  It uses Express, Mongoose, and MongoDB to store the data in a noSQL database.

## Links
Client UI: https://mind-blowing-desert-bandits.github.io/sserpdrow-client/
Client UI Repo: https://github.com/Mind-Blowing-Desert-Bandits/sserpdrow-client
API Repo: https://github.com/Mind-Blowing-Desert-Bandits/sserpdrow-api
API Endpoint: https://sserpdrow-mbdb-api.herokuapp.com/

## Technologies Used
Express; Mongo; Mongoose

## Unsolved Problems
No real unsolved problems.  We mainly ran out of time.  This prevented us from implementing some things the way we wanted to (AKA: Pull a single site based on the user id via the API).  We handled this by quickly implementing ways to get at the data we wanted via the front-end.

## Planning, Process, and Problem Solving Strategy
We originally had some issues with understanding what our Prompt was asking for us to create.  To address this, we whiteboarded a high level flow or what the user experience would be for the UI.  On the backend, we whiteboarded what we expected the corresponded BSON would look like.  After that was done, we gave each other assignments to tackle during the weekend.  We all created user stories, and discussed them on Monday.  After that was done, we split into teams of two to focus on specific application features.

We worked out a daily workflow for the team. We first met together for a brief stand-up meeting in the morning to address the main features we would work on during the day and then met up periodically during the day to provide updates on how the features were progressing and also to brainstorm if we hit any snags that involved the whole team. This enabled us to problem solve effectively

The largest challenge was visualizing the user experience given the need to create multiple pages for each user as well as blog posts. We addressed this issue by creating a sites collection that consisted of a site id, title, date, a blopposts array consisiting of blog objects, and a pages array consisting of user pages.

## ERD
https://imgur.com/xSEGWVP


## Dependencies

Install with `npm install`.

-   [`express`](http://expressjs.com/)
-   [`mongoose`](http://mongoosejs.com/)

## API
### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

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
scripts/sign-up.sh
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
scripts/sign-in.sh
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

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:4741/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### Sites

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/sites`               | `sites#index`     |
| GET    | `/sites/:id`           | `sites#show`      |
| POST   | `/sites`               | `sites#create`    |
| PATCH  | `/sites/:id`           | `sites#update`    |
| DELETE | `/sites/:id`           | `sites#destroy`   |

#### GET /sites

Request:

```sh
API="http://localhost:4741"
URL_PATH="/sites"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

```

```sh
scripts/sites/index
```

Response:

```md
$ sh scripts/sites/index.sh
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 2909
ETag: W/"b5d-89C1stsUeo1m9F1c+6S22q6j9Gw"
Date: Mon, 06 Nov 2017 19:14:30 GMT
Connection: keep-alive

{"sites":[{"_id":"5a008d8ccb130f09a01776d2","updatedAt":"2017-11-06T16:27:56.282Z","createdAt":"2017-11-06T16:27:56.282Z","title":"Davids Blog","_owner":"5a00736d844be485fad04c9d","blog":[{"_id":"5a008d8ccb130f09a01776d4","textcontent":"I had a good summer.","title":"My Summer"},{"_id":"5a008d8ccb130f09a01776d3","textcontent":"Winter sucked.  It was cold.","title":"My Winter"}],"__v":0,"pages":[],"blogposts":[],"id":"5a008d8ccb130f09a01776d2","editable":false},{"_id":"5a008eb42fd43a0acc307df2","updatedAt":"2017-11-06T18:50:44.279Z","createdAt":"2017-11-06T16:32:52.019Z","title":"Davids Blog","_owner":"5a00736d844be485fad04c9d","__v":0,"pages":[{"_id":"5a00ada04d256c122d6f6415","textcontent":"We are a farm","title":"About My Business","type":"about","id":"5a00ada04d256c122d6f6415"},{"_id":"5a00ada04d256c122d6f6414","textcontent":"9-5 M-F","title":"Our Store Hours","type":"hours","id":"5a00ada04d256c122d6f6414"}],"blogposts":[{"_id":"5a00af04824c4a1291a154e4","textcontent":"changed had a good summer.","title":"changed His Summer","date":"2017-11-06T18:50:44.278Z","id":"5a00af04824c4a1291a154e4"},{"_id":"5a00af04824c4a1291a154e3","textcontent":"changed Winter sucked.  It was cold.","title":" changedMy Winter","date":"2017-11-06T18:50:44.278Z","id":"5a00af04824c4a1291a154e3"}],"id":"5a008eb42fd43a0acc307df2","editable":false},{"_id":"5a00911c5a1a080b4c065c5a","updatedAt":"2017-11-06T16:43:08.042Z","createdAt":"2017-11-06T16:43:08.042Z","title":"Davids Blog","_owner":"5a00736d844be485fad04c9d","__v":0,"pages":[{"type":"about","title":"About My Business","textcontent":"We are a farm","_id":"5a00911c5a1a080b4c065c5b","id":"5a00911c5a1a080b4c065c5b"}],"blogposts":[{"title":"My Summer","textcontent":"I had a good summer.","_id":"5a00911c5a1a080b4c065c5d","date":"2017-11-06T19:14:30.171Z","id":"5a00911c5a1a080b4c065c5d"},{"title":"My Winter","textcontent":"Winter sucked.  It was cold.","_id":"5a00911c5a1a080b4c065c5c","date":"2017-11-06T19:14:30.171Z","id":"5a00911c5a1a080b4c065c5c"}],"id":"5a00911c5a1a080b4c065c5a","editable":false},{"_id":"5a00919e5a1a080b4c065c5e","updatedAt":"2017-11-06T16:45:18.139Z","createdAt":"2017-11-06T16:45:18.139Z","title":"Davids Blog","_owner":"5a00736d844be485fad04c9d","__v":0,"pages":[{"type":"about","title":"About My Business","textcontent":"We are a farm","_id":"5a00919e5a1a080b4c065c60","id":"5a00919e5a1a080b4c065c60"},{"type":"hours","title":"Our Store Hours","textcontent":"9-5 M-F","_id":"5a00919e5a1a080b4c065c5f","id":"5a00919e5a1a080b4c065c5f"}],"blogposts":[{"title":"My Summer","textcontent":"I had a good summer.","_id":"5a00919e5a1a080b4c065c62","date":"2017-11-06T19:14:30.171Z","id":"5a00919e5a1a080b4c065c62"},{"title":"My Winter","textcontent":"Winter sucked.  It was cold.","_id":"5a00919e5a1a080b4c065c61","date":"2017-11-06T19:14:30.171Z","id":"5a00919e5a1a080b4c065c61"}],"id":"5a00919e5a1a080b4c065c5e","editable":false}]}
```

#### GET /sites/:id

Request:

```sh
API="http://localhost:4741"
URL_PATH="/sites"
TOKEN=gNrwGnmXckEr56LnSyqzsUbEAeSxBh19qyJ+yYN/6us=--VmVUG8at2lC6fEuhrhp0x3lKIwVnNq2QCuEv7Dd5uo8=
ID=5a0093363b2f1a0bfdb735cf

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
```

```sh
scripts/sites/show.sh
```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 886
ETag: W/"376-pMmNK+lGbcCCS7rYyeg1TXF0U24"
Date: Mon, 06 Nov 2017 19:17:08 GMT
Connection: keep-alive

{"site":{"_id":"5a008eb42fd43a0acc307df2","updatedAt":"2017-11-06T18:50:44.279Z","createdAt":"2017-11-06T16:32:52.019Z","title":"Davids Blog","_owner":"5a00736d844be485fad04c9d","__v":0,"pages":[{"_id":"5a00ada04d256c122d6f6415","textcontent":"We are a farm","title":"About My Business","type":"about","id":"5a00ada04d256c122d6f6415"},{"_id":"5a00ada04d256c122d6f6414","textcontent":"9-5 M-F","title":"Our Store Hours","type":"hours","id":"5a00ada04d256c122d6f6414"}],"blogposts":[{"_id":"5a00af04824c4a1291a154e4","textcontent":"changed had a good summer.","title":"changed His Summer","date":"2017-11-06T18:50:44.278Z","id":"5a00af04824c4a1291a154e4"},{"_id":"5a00af04824c4a1291a154e3","textcontent":"changed Winter sucked.  It was cold.","title":" changedMy Winter","date":"2017-11-06T18:50:44.278Z","id":"5a00af04824c4a1291a154e3"}],"id":"5a008eb42fd43a0acc307df2","editable":true}}
```

#### POST /sites

Request:

```sh
#!/bin/bash
# {"user":{"_id":"5a00736d844be485fad04c9d","updatedAt":"2017-11-06T14:41:21.313Z","createdAt":"2017-11-06T14:36:29.601Z","email":"asdf@asdf.com","token":"gNrwGnmXckEr56LnSyqzsUbEAeSxBh19qyJ+yYN/6us=--VmVUG8at2lC6fEuhrhp0x3lKIwVnNq2QCuEv7Dd5uo8=","__v":0,"password":null,"id":"5a00736d844be485fad04c9d"}}
API="http://localhost:4741"
URL_PATH="/sites"
PAGETITLE="Davids Blog"
BLOGPOST1TITLE="My Summer"
BLOGPOST1TEXT="I had a good summer."
BLOGPOST2TITLE="My Winter"
BLOGPOST2TEXT="Winter sucked.  It was cold."
PAGE1TYPE="about"
PAGE1TITLE="About My Business"
PAGE1TEXTCONTENT="We are a farm"
PAGE2TYPE="hours"
PAGE2TITLE="Our Store Hours"
PAGE2TEXTCONTENT="9-5 M-F"
TOKEN=gNrwGnmXckEr56LnSyqzsUbEAeSxBh19qyJ+yYN/6us=--VmVUG8at2lC6fEuhrhp0x3lKIwVnNq2QCuEv7Dd5uo8=

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "site":
    {
      "title": "'"${PAGETITLE}"'",
      "blogposts":
      [
        {
          "title": "'"${BLOGPOST1TITLE}"'",
          "textcontent": "'"${BLOGPOST1TEXT}"'"
        },
        {
          "title": "'"${BLOGPOST2TITLE}"'",
          "textcontent": "'"${BLOGPOST2TEXT}"'"
        }
      ],
      "pages": [{
        "type": "'"${PAGE1TYPE}"'",
        "title": "'"${PAGE1TITLE}"'",
        "textcontent": "'"${PAGE1TEXTCONTENT}"'"
      }, {
        "type": "'"${PAGE2TYPE}"'",
        "title": "'"${PAGE2TITLE}"'",
        "textcontent": "'"${PAGE2TEXTCONTENT}"'"
      }]
    }
  }'

echo

```

```sh
scripts/sites/create.sh
```

Response:

```md
HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 855
ETag: W/"357-dl8POyfxkireaqzdthng8iNgDtw"
Date: Mon, 06 Nov 2017 19:20:02 GMT
Connection: keep-alive

{"site":{"__v":0,"updatedAt":"2017-11-06T19:20:02.990Z","createdAt":"2017-11-06T19:20:02.990Z","title":"Davids Blog","_owner":"5a00736d844be485fad04c9d","_id":"5a00b5e2824c4a1291a154e5","pages":[{"type":"about","title":"About My Business","textcontent":"We are a farm","_id":"5a00b5e2824c4a1291a154e7","id":"5a00b5e2824c4a1291a154e7"},{"type":"hours","title":"Our Store Hours","textcontent":"9-5 M-F","_id":"5a00b5e2824c4a1291a154e6","id":"5a00b5e2824c4a1291a154e6"}],"blogposts":[{"title":"My Summer","textcontent":"I had a good summer.","_id":"5a00b5e2824c4a1291a154e9","date":"2017-11-06T19:20:02.985Z","id":"5a00b5e2824c4a1291a154e9"},{"title":"My Winter","textcontent":"Winter sucked.  It was cold.","_id":"5a00b5e2824c4a1291a154e8","date":"2017-11-06T19:20:02.984Z","id":"5a00b5e2824c4a1291a154e8"}],"id":"5a00b5e2824c4a1291a154e5","editable":true}}
~/wdi/projects/sserpdrow-api (pageInitialSetup)
```

#### PATCH /sites/:id

Request:

```sh
#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sites"
TOKEN=gNrwGnmXckEr56LnSyqzsUbEAeSxBh19qyJ+yYN/6us=--VmVUG8at2lC6fEuhrhp0x3lKIwVnNq2QCuEv7Dd5uo8=
ID=5a0093363b2f1a0bfdb735cf
PAGETITLE="Julies Blog"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "site": {
      "title": "'"${PAGETITLE}"'"
    }
  }'

echo

```

```sh
scripts/sites/update.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sites/:id

Request:

```sh
#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sites"
TOKEN=gNrwGnmXckEr56LnSyqzsUbEAeSxBh19qyJ+yYN/6us=--VmVUG8at2lC6fEuhrhp0x3lKIwVnNq2QCuEv7Dd5uo8=
ID=5a0093363b2f1a0bfdb735cf

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo

```

```sh
script/sites/destoy.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
