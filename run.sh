#!/bin/bash


ARG=$1

#exit if any command fails
set -e

if [[ $ARG == "produce" ]]; then

    cd $MKDOCS_SITE
    mkdocs build 1>&2
    tar -czf site.tar.gz site/ 

elif [[ $ARG == "serve" ]]; then

    cd $MKDOCS_SITE
    tar -xzf site.tar.gz 1>&2
    mkdocs serve -a 0.0.0.0:8000 1>&2

else
    exit
fi
