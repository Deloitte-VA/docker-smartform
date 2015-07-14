#!/bin/bash
echo ${USER}
echo ${DB_PORT_27017_TCP_ADDR}
echo ${DEPLOYED_CODE}
echo ${SMARTFORM_NODEJS_PORT}
echo ${SMARTFORM_HOST_IP}
echo ${CATALINA_HOME}

# dynamically config EyeCare and ecurd
cp "${CATALINA_HOME}"/webapps/EyeCare/app/js/services.js.localhost "${CATALINA_HOME}"/webapps/EyeCare/app/js/services.js&&sed -i "s/localhost:3001/${SMARTFORM_HOST_IP}:${SMARTFORM_NODEJS_PORT}/g" "${CATALINA_HOME}"/webapps/EyeCare/app/js/services.js&&cp "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json.localhost "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json&&sed -i "s/localhost/${DB_PORT_27017_TCP_ADDR}/g" "$DEPLOYED_CODE"/vlerdas-ecrud/config/default.json

cd "$DEPLOYED_CODE"/vlerdas-ecrud
catalina.sh run & node ./bin/server.js
