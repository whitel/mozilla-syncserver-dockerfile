# VERSION 0.1
# Derived from ubuntu version by Arthur Caranta "arthur+code.mozillasyncdocker@caranta.com" found at 
# https://github.com/acaranta/mozilla-syncserver-dockerfile
# DESCRIPTION:    mozilla syncserver container
# TO_BUILD:       docker build -rm -t syncserver .
# TO_RUN:         docker run -p 5000:5000 syncserver
I AM BROKEN
FROM centos
MAINTAINER Langdon White "langdon+code.mozillasyncdocker@fishjump.com"

RUN yum -y update
RUN yum install -y centos-release-SCL
RUN yum -y install git scl-utils python-virtualenv python27
RUN yum clean all

RUN git clone https://github.com/mozilla-services/syncserver.git 
RUN cd syncserver && make build
RUN mkdir /opt/syncserver/ && cp /syncserver/syncserver.ini /opt/syncserver/config.ini
RUN echo "sqluri = sqlite:////tmp/syncserver.db" >>/opt/syncserver/config.ini
RUN echo "allow_new_users = true" >>/opt/syncserver/config.ini
RUN perl -p -i -e 's#pserve ./syncserver.ini#pserve /opt/syncserver/config.ini#g' /syncserver/Makefile

EXPOSE 5000

CMD cd syncserver && make serve
