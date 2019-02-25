### MKDOCS Container

Service to generate a site using the mkdocs application. There are two options to generate the site, one for use the produce arg, which will generate the site in a tar.gz file and another one with produce arg, which will take the tar.gz file generated before and will deploy a new site into application.So the application has the principal core:

- python
- pytest
- mkdocs
- bash



#### Running the application


This docker container runs mkdocs in two ways:

1. Generate the site using the local path directory with the arg produce:

```
Example: docker run  --mount type=bind,source=\$(pwd)",target=/mkdocs -e MKDOCS_SITE=<MKDOCS_PROJECT_DIRECTORY> -it wtcampos/mkdocs_container produce

```
	
2. Run the mkdocs with the tar.gz file produced before:

```
Example: docker run  -p8000:8000 --mount type=bind,source=\$(pwd)",target=/mkdocs -e MKDOCS_SITE=<MKDOCS_PROJECT_DIRECTORY> -it wtcampos/mkdocs_container serve

```

You have a wrapper script called mkdockerize.sh, so to run the app using this script just run:

```
sh mkdockerize produce <PROJECT_FOLDER> 

```

To create the site, run:

```
sh mkdocreize serve <PROJECT_FOLDER>

```

To serve the site.


The app was deployed to Docker hub, so the image is public with the name wtcampos/mkdocs_container 


### Directory tree

```
mkdocs_container/
├── Dockerfile
├── mkdockerize.sh
├── __pycache__
│   └── tests.cpython-36-PYTEST.pyc
├── README.md
├── run.sh
├── testdocs
│   ├── docs
│   │   └── index.md
│   ├── mkdocs.yml
│   ├── site
│   │   ├── 404.html
│   │   ├── css
│   │   │   ├── base.css
│   │   │   ├── bootstrap-custom.min.css
│   │   │   └── font-awesome.min.css
│   │   ├── fonts
│   │   │   ├── fontawesome-webfont.eot
│   │   │   ├── fontawesome-webfont.svg
│   │   │   ├── fontawesome-webfont.ttf
│   │   │   ├── fontawesome-webfont.woff
│   │   │   ├── fontawesome-webfont.woff2
│   │   │   ├── glyphicons-halflings-regular.eot
│   │   │   ├── glyphicons-halflings-regular.svg
│   │   │   ├── glyphicons-halflings-regular.ttf
│   │   │   ├── glyphicons-halflings-regular.woff
│   │   │   └── glyphicons-halflings-regular.woff2
│   │   ├── img
│   │   │   ├── favicon.ico
│   │   │   └── grid.png
│   │   ├── index.html
│   │   ├── js
│   │   │   ├── base.js
│   │   │   ├── bootstrap-3.0.3.min.js
│   │   │   └── jquery-1.10.2.min.js
│   │   ├── search
│   │   │   ├── lunr.js
│   │   │   ├── main.js
│   │   │   ├── search_index.json
│   │   │   └── worker.js
│   │   ├── sitemap.xml
│   │   └── sitemap.xml.gz
│   ├── site.tar.gz
│   └── site.tgz
└── tests.py
```

### Prerequisites

##Docker

To install on Linux or MAC, execute the line below: 

```
$ curl -fsSL https://get.docker.com | bash

```


### Running the test

Run integration tests with pytest:

```
$ pytest -v tests.py

```

You can run the test after run the serve command with the command below:


```

$docker exec -it mkdocs_serve  pytest tests.py

```



