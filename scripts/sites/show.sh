#!/bin/sh

API="http://localhost:4741"
URL_PATH="/sites"
TOKEN=gNrwGnmXckEr56LnSyqzsUbEAeSxBh19qyJ+yYN/6us=--VmVUG8at2lC6fEuhrhp0x3lKIwVnNq2QCuEv7Dd5uo8=
ID=5a008eb42fd43a0acc307df2

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
