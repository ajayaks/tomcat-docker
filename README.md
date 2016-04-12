Create first docker image

1. Create Docker file
2. If docker daemon is not running then docker build wont work so 
3. If you are first time starting or creating image on mac then run "Docker quickstart" from launchpad. https://docs.docker.com/engine/installation/mac/ 
4. Via point 3 , it will create default VM, you can check from Virtual Box tool
5. Once its ready then , you can try "docker info" or "docker images" 
6.  Build docker image "docker build -t tomcat7 ."  , it will create a docker image with name tomcat7.
7. Now run it , "docker run -p 8080:8080 -d tomcat7"

Important commands:-

1. "docker ps -a"  , this will give you container ID and imageID
2. "docker rm <container ID>" , it will remove or stop the container
3. "docker rmi <image name>" , "docker rmi tomcat7" , it will remove the image
4. docker run -i -t tomcat7 /bin/bash

Somwhow if i start tomcat service from docker then its returning fail so i have commented the service start so for that follow below:-

1. docker run -i -t tomcat7 /bin/bash
2. service tomcat7 start



