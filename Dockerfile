# Docker container suitable for SSL terminating other http containers
# I suggest mounting in the sites-enabled config dir as well as a dir
# with your ssl keys.

FROM         jayofdoom/docker-ubuntu-14.04
MAINTAINER   Jay Faulkner "jay.faulkner@rackspace.com"

RUN apt-get update && apt-get install -y apache2

RUN a2enmod proxy_http ssl redirect

EXPOSE 80 443

# Default to 64mb (memcached default). Can be overridden on docker command line.
CMD ["-f /etc/apache2/apache2.conf -D FOREGROUND"]
ENTRYPOINT ["/usr/sbin/apache2ctl"]
