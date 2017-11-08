API="http://localhost:4741"
URL_PATH="/deleteblogpost"
TOKEN=dRX/tn/+r8aAozv+ZKbhtRbTc+kGgbk/l6QqfVorq80=--9e+DJND5gt3eUVsXuZybndEADPIbA7W3QCloZK28Nto=
POSTID=5a03305f22b8438f86a03ba9

curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "site": {
      "blogID": "'"${POSTID}"'"
    }
  }'
echo
