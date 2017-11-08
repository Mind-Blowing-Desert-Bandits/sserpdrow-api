API="http://localhost:4741"
URL_PATH="/deletepage"
TOKEN=AHunFjPQZLOE8w6x6ZqXbng6jO3mxm3qgEdVDgipFCs=--MaLjYnS+8pUQrN60P6Hww5Za+C7WDuWoSNfj9lIvQFE=
POSTID=5a0331ecbd3c6691949bb070

curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "site": {
      "pageID": "'"${POSTID}"'"
    }
  }'
echo
