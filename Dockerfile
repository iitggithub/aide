FROM centos:7.2.1511

MAINTAINER "The Ignorant IT Guy" <iitg@gmail.com>

RUN yum -y --nogpgcheck install \
                                aide && \
                                yum clean all

# Install the default AIDE configuration
COPY aide.conf /etc/aide.conf

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
