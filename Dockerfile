FROM alpine

RUN apk add --no-cache\
    python3\
    bash &&\
    pip3 install --upgrade pip &&\
    pip3 install mkdocs &&\
    pip3 install pytest &&\
    pip3 install requests

RUN apk add -U tzdata
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN mkdir -p mkdocs
WORKDIR mkdocs
ADD tests.py /mkdocs 
ARG MKDOCS_SITE
ADD run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"] 
CMD []
