FROM deloitteva/docker-tomcat:8.0.23
MAINTAINER Kun Yue<KunYue96@gmail.com>

# ##################
# install NodeJS
# ##################
# verify gpg and sha256: http://nodejs.org/dist/v0.12.5/SHASUMS256.txt.asc
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 7937DFD2AB06298B2293C3187D33FF9D0246406D 114F43EE0176B71C7BC219DD50A3051F888C628D

ENV NODE_VERSION 0.12.6
ENV NPM_VERSION 2.11.3
RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
&& curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
&& gpg --verify SHASUMS256.txt.asc \
&& grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
&& tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
&& rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
&& npm install -g npm@"$NPM_VERSION" \
&& npm cache clear

EXPOSE 3001
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
