# snp-docker-image-smartform

This project for standing up SmartForm application in a docker container.


## Build images

Checkout, then execute command:

```
$ sudo ./build.sh
```
## Run container
* run [mongodb container](https://github.com/Deloitte-VA/snp-prototype-mongodb):

    ```
    docker run -d -p <HOST_PORT>:27017 --name snp-mongodb jlgrock/snp-prototype-mongodb
    ```   


* link this container with the container running above:

    ```
    sudo docker run -it --name snp-smartform -p <HOST_PORT_FOR_TOMCAT>:8080 -p <HOST_PORT_FOR_NODE>:3001 --env SMARTFORM_HOST_IP=<HOST_IP> --env SMARTFORM_NODEJS_PORT=<HOST_PORT_FOR_NODE> --link snp-mongodb:db kunyue/smartform:v1 /bin/bash
    ```
