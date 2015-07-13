#!/bin/bash
echo ${USER}
echo ${DB_PORT_27017_TCP_ADDR}
echo $DEPLOYED_CODE

# cp default.json.localhost default.json
cp "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json.localhost "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json
# sed -i "s/localhost/${USER}/g" default.json
sed -i "s/localhost/${DB_PORT_27017_TCP_ADDR}/g" "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json

cd "$DEPLOYED_CODE"/vlerdas-ecrud
catalina.sh run & node ./bin/server.js
