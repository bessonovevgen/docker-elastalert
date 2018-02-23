# Dockerfile for Elastalert
FROM fedora
MAINTAINER nelluri@redhat.com

RUN dnf -y update && \
    dnf -y install unzip tar wget vim git make gcc readline-devel pcre-devel openssl-devel python-pip python redhat-rpm-config gcc-c++ python-devel && \
    dnf clean all && cd /opt && wget https://github.com/Yelp/elastalert/archive/master.zip && \
    unzip -- *.zip && \
    mv -- elast* ${ELASTALERT_HOME} && \
    rm -- *.zip

ENV ELASTALERT_HOME /opt/elastalert
ENV RULES_DIR /opt/elastalert/rules

WORKDIR ${ELASTALERT_HOME}
RUN mkdir -p ${RULES_DIR} && python setup.py install && \
    pip install -e .

COPY ./start-elastalert.sh /opt/start-elastalert.sh
RUN chmod +x /opt/start-elastalert.sh

ENTRYPOINT ["/opt/start-elastalert.sh"]
CMD ["/usr/bin/elastalert", "--config", "/opt/elastalert/config.yaml", "--verbose"]
