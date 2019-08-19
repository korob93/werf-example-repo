### Werf issue example repo

#### Overview
This repo illustrates incompatibility between some process supervisors like 
[just-containers/s6-overlay](https://github.com/just-containers/s6-overlay)
and docker images based on stapel.

#### Problem to solve
Let's assume we need to build nginx based dockerfile which exposes 80 port
and returns `HTTP 200 OK` on any HTTP GET request. For some reason we decide
to use process supervisor. We have a set of options.

##### Use pure docker
```
./build_nginx_with_docker.sh
./run nginx_with_docker.sh
```
We can confirm nginx has started listening port `8080` on host machine 

##### Use werf dockerfile image
```
./build_nginx_dockerfile_with_werf.sh
./run_nginx_dockerfile_with_werf.sh
```
As well, we can see that nginx has started listening port `8080` on host machine

##### Use werf stapel image (the problem)
```
./build_nginx_stapel_with_werf.sh
./run_nginx_stapel_with_werf.sh
```
Here we can see that container starts as expected but then it finishes.
Let's have a look at workaround for this

##### Use werf stapel image (workaround)
```
./run_nginx_stapel_with_werf_custom_entrypoint.sh
```
In this case everything works as we expect