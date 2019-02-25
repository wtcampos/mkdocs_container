#!/bin/bash
ARG=$1

#exit if any command fails
set -e


#Verify the argument to produce or serve the site
if [[ $ARG == "produce" ]]; then
 
	docker run --name mkdocs -p 8000:8000 --mount type=bind,source="$(pwd)",target=/mkdocs -e MKDOCS_SITE=$2 -it wtcampos/mkdocs_container produce

elif [[ $ARG == "serve" ]]; then

	docker run --name mkdocs -p 8000:8000 --mount type=bind,source="$(pwd)",target=/mkdocs -e MKDOCS_SITE=$2 -it wtcampos/mkdocs_container serve


else
    cat <<USAGE
This docker container runs mkdocs in two ways:

1. Generate the site using the local path directory with the arg produce:

Example: sh mkdockerize.sh produce <DIRECTORY_PROJECT> 

2. Run the mkdocs with the tar.gz file produced before:

Example: sh mkdockerize.sh serve <DIRECTORY_PROJECT> 

USAGE
    exit
fi

