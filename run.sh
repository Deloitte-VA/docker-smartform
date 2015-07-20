#!/bin/bash
echo ${USER}
echo ${DB_PORT_27017_TCP_ADDR}
echo ${DEPLOYED_CODE}
echo ${SMARTFORM_NODEJS_PORT}
echo ${SMARTFORM_HOST_IP}
echo ${CATALINA_HOME}

if [ ! -d "${DEPLOYED_CODE}"/EyeCare ]; then
    unzip "${DEPLOYED_CODE}"/webapps.zip -d "${DEPLOYED_CODE}"
fi

# dynamically config EyeCare and ecurd
cp "${DEPLOYED_CODE}"/EyeCare/app/js/services.js.localhost "${DEPLOYED_CODE}"/EyeCare/app/js/services.js
sed -i "s/localhost:3001/${SMARTFORM_HOST_IP}:${SMARTFORM_NODEJS_PORT}/g" "${DEPLOYED_CODE}"/EyeCare/app/js/services.js

rm -rf "$CATALINA_HOME"/webapps/EyeCare*
cd "${DEPLOYED_CODE}"/EyeCare
jar cvf "$CATALINA_HOME"/webapps/EyeCare.war .
cp -r "${DEPLOYED_CODE}"/EyeCare "$CATALINA_HOME"/webapps/

cp "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json.localhost "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json&&sed -i "s/localhost/${DB_PORT_27017_TCP_ADDR}/g" "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json

cd "$DEPLOYED_CODE"/vlerdas-ecrud
catalina.sh run & node ./bin/server.js
