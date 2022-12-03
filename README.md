# Base Docker image ![Continuous Docker Image Build](https://github.com/ems-project/docker-php-fpm/workflows/Continuous%20Docker%20Image%20Build/badge.svg)

Docker base image is the basic image on which you add layers (which are basically filesystem changes) and create a final image containing your App.  

## Features

Use [Official PHP Docker image](https://hub.docker.com/_/php) as parent.  
Use [Supervisord] as manager for Webserver **and** PHP-FPM.  Supervisord is therefore process 1.  
Run container as non-privileged.  
Container Entrypoint hooks available.  

Installation of [Nginx](https://pkgs.alpinelinux.org/package/v3.12/main/x86_64/nginx).  
Installation of [Apache 2.4](https://pkgs.alpinelinux.org/package/v3.12/main/x86_64/apache2).  

## Build

```
set -a
source .build.env
set +a

docker build --build-arg VERSION_ARG=${PHP_VERSION} \
             --build-arg RELEASE_ARG=snapshot \
             --build-arg BUILD_DATE_ARG="" \
             --build-arg VCS_REF_ARG="" \
             --target php-fpm-prod \
             -t ${PHPFPM_PRD_DOCKER_IMAGE_NAME}:rc .

docker build --build-arg VERSION_ARG=${PHP_VERSION} \
             --build-arg RELEASE_ARG=snapshot \
             --build-arg BUILD_DATE_ARG="" \
             --build-arg VCS_REF_ARG="" \
             --target php-fpm-dev \
             -t ${PHPFPM_DEV_DOCKER_IMAGE_NAME}:rc .

docker build --build-arg VERSION_ARG=${PHP_VERSION} \
             --build-arg RELEASE_ARG=snapshot \
             --build-arg BUILD_DATE_ARG="" \
             --build-arg VCS_REF_ARG="" \
             --target apache-prod \
             -t ${APACHE_PRD_DOCKER_IMAGE_NAME}:rc .

docker build --build-arg VERSION_ARG=${PHP_VERSION} \
             --build-arg RELEASE_ARG=snapshot \
             --build-arg BUILD_DATE_ARG="" \
             --build-arg VCS_REF_ARG="" \
             --target apache-dev \
             -t ${APACHE_DEV_DOCKER_IMAGE_NAME}:rc .

docker build --build-arg VERSION_ARG=${PHP_VERSION} \
             --build-arg RELEASE_ARG=snapshot \
             --build-arg BUILD_DATE_ARG="" \
             --build-arg VCS_REF_ARG="" \
             --target nginx-prod \
             -t ${NGINX_PRD_DOCKER_IMAGE_NAME}:rc .

docker build --build-arg VERSION_ARG=${PHP_VERSION} \
             --build-arg RELEASE_ARG=snapshot \
             --build-arg BUILD_DATE_ARG="" \
             --build-arg VCS_REF_ARG="" \
             --target nginx-prod \
             -t ${NGINX_DEV_DOCKER_IMAGE_NAME}:rc .
```

## Test 

```
set -a
source .build.env
set +a

bats test/tests.apache.bats
bats test/tests.nginx.bats
bats test/tests.php-fpm.bats
bats test/tests.varnish.bats
```