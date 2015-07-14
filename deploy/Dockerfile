FROM kunyue/centos-oraclejdk8-node:0.12.5
MAINTAINER Kun Yue<KunYue96@gmail.com>

# ##################
# deploy code
# ##################
ENV DEPLOYED_CODE /code/smartform
RUN mkdir -p "$DEPLOYED_CODE"

ADD code/webapps.zip "$DEPLOYED_CODE"/webapps.zip

ADD code/SMARTForm_Code_vlerdas_20150615_KunConfig.zip "$DEPLOYED_CODE"/SMARTForm_Code_vlerdas_20150615_KunConfig.zip
RUN unzip "$DEPLOYED_CODE"/SMARTForm_Code_vlerdas_20150615_KunConfig.zip -d "$DEPLOYED_CODE"

ADD run.sh "$DEPLOYED_CODE"/run.sh

# ##################
# startup servers
# ##################
CMD $DEPLOYED_CODE/run.sh
