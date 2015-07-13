#!/bin/bash
docker build -t="kunyue/centos-oraclejdk8:u45" oraclejdk8
docker build -t="kunyue/centos-oraclejdk8-tomdat8:0.23" tomcat8
docker build -t="kunyue/centos-oraclejdk8-node:0.12.5" nodejs 
docker build -t="kunyue/smartform:v1" deploy
