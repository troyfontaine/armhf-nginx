############################################################
# Dockerfile to build ARMhf Nginx Installed Containers
# Based on troyfontaine/armhf-alpinelinux
############################################################

FROM troyfontaine/armhf-alpinelinux:3.5

MAINTAINER Troy Fontaine

# Update the repository and install tools
RUN \
  apk --update add nginx && \
  mkdir /etc/nginx/sites-enabled && \
  mkdir /etc/nginx/certs && \
  mkdir -p /run/nginx && \
  chown -R nginx:nginx /var/www/localhost/htdocs

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/sites-enabled/default.conf

# Define mountable directories
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/www/localhost/htdocs"]

# Set the default command to execute when creating a new container
CMD ["nginx","-g","daemon off;"]

# Expose Ports
EXPOSE 80 443
