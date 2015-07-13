FROM kunyue/centos-oraclejdk8-node:0.12.5
MAINTAINER Kun Yue<KunYue96@gmail.com>

# ##################
# deploy code
# ##################
ADD code/webapps.zip "$CATALINA_HOME"/webapps.zip
RUN unzip "$CATALINA_HOME"/webapps.zip -d "$CATALINA_HOME"/webapps

ENV DEPLOYED_CODE /code/smartform
RUN mkdir -p "$DEPLOYED_CODE"
ADD code/SMARTForm_Code_vlerdas_20150615_KunConfig.zip "$DEPLOYED_CODE"/SMARTForm_Code_vlerdas_20150615_KunConfig.zip
RUN unzip "$DEPLOYED_CODE"/SMARTForm_Code_vlerdas_20150615_KunConfig.zip -d "$DEPLOYED_CODE"

ADD run.sh "$DEPLOYED_CODE"/run.sh

# ##################
# startup servers
# ##################
CMD $DEPLOYED_CODE/run.sh
