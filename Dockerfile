############################################################
# Dockerfile to build ARMhf Nginx Installed Containers
# Based on armv7/armhf-ubuntu
############################################################

FROM armv7/armhf-ubuntu:14.04.2

MAINTAINER Troy Fontaine

# Update the repository and install tools
RUN \ 
  apt-get update && apt-get -y install nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
  && sed -i 's/^http {/&\n    server_names_hash_bucket_size 128;/g' /etc/nginx/nginx.conf \
  && sed -i 's/^http {/&\n    server_tokens off;/g' /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Set the default command to execute when creating a new container
CMD ["nginx"]

# Expose Ports
EXPOSE 80 443
