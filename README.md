### MKDOCS Container
This docker container runs mkdocs in two ways:

1. Generate the site using the local path directory with the arg produce:

```
Example: docker run  --mount type=bind,source=\$(pwd)",target=/mkdocs -e MKDOCS_SITE=<MKDOCS_PROJECT_DIRECTORY> -it wtcampos/mkdocs_container produce
```
	
2. Run the mkdocs with the tar.gz file produced before:

```
Example: docker run  -p8000:8000 --mount type=bind,source=\$(pwd)",target=/mkdocs -e MKDOCS_SITE=<MKDOCS_PROJECT_DIRECTORY> -it wtcampos/mkdocs_container serve
```

