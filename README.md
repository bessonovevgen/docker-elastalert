# Docker ElastAlert
Containerized elastalert.

## Building
You can build the container like

$ docker build -t elastalert .

## Configuration
The config.yaml file will be used as configuration. You need to mount your config.yaml file to /opt/elastalert/ directory like

$ docker run -v "$PWD/config.yaml:/opt/elastalert/config.yaml" -e "ELASTICSEARCH_HOST=some.elasticsearch.host.com" -e "ELASTICSEARCH_PORT=9200" elastalert

## Creating a Index
By default an index named elastalert_status is created in your elasticsearch instance, you can change it by changing the name in start-elastalert.sh script.

## Alerting
Depending on your desired alerts you may need to mount files into the container. For example:

$ docker run -v "$PWD/rules:/opt/elastalert/rules" -e "ELASTICSEARCH_HOST=some.elasticsearch.host.com" -e "ELASTICSEARCH_PORT=9200" elastalert
