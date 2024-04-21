#!/usr/bin/env bash

PHP_FPM_MAX_CHILDREN_DEFAULT="40"
PHP_FPM_REQUEST_MAX_MEMORY_IN_MEGABYTES_DEFAULT="16"
CONTAINER_HEAP_PERCENT_DEFAULT="0.80"

export PHP_FPM_MAX_CHILDREN_AUTO_RESIZING=${PHP_FPM_MAX_CHILDREN_AUTO_RESIZING:-"false"}

export PHP_FPM_MAX_CHILDREN=${PHP_FPM_MAX_CHILDREN:-"${PHP_FPM_MAX_CHILDREN_DEFAULT}"}
export PHP_FPM_REQUEST_MAX_MEMORY_IN_MEGABYTES=${PHP_FPM_REQUEST_MAX_MEMORY_IN_MEGABYTES:-"${PHP_FPM_REQUEST_MAX_MEMORY_IN_MEGABYTES_DEFAULT}"}
export CONTAINER_HEAP_PERCENT=${CONTAINER_HEAP_PERCENT:-"${CONTAINER_HEAP_PERCENT_DEFAULT}"}

true
