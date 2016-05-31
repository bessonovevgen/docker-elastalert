#!/bin/sh
set -e


if ! curl -f ${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT} >/dev/null 2>&1
then
	echo "Elasticsearch not available at ${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}"
else
	if ! curl -f ${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}/elastalert_status >/dev/null 2>&1
	then
		echo "Creating Elastalert index in Elasticsearch..."
	    elastalert-create-index --index elastalert_status --old-index ""
	else
	    echo "Elastalert index already exists in Elasticsearch."
	fi
fi
exec "$@"

