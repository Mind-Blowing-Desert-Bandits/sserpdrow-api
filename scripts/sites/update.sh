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
