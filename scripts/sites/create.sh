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
