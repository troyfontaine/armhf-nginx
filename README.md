# Dockerfile for Nginx on ARMHF
Dockerfile for setting up an Nginx container on ARMHF (compatible with Raspberry Pi 2 Model B)

## Base Docker Image
<a href="https://registry.hub.docker.com/u/armv7/armhf-ubuntu/">armv7/armhf-ubuntu</a>

## Installation
1. Install Docker
2. Download <a href="https://registry.hub.docker.com/u/troyfontaine/armhf-nginx/">the pre-built image</a> from the <a href="https://registry.hub.docker.com/">Docker Hub Registry</a>: docker pull troyfontaine/armhf-nginx
(alternatively, you can build an image from Dockerfile: `docker build -t="troyfontaine/armhf-nginx" github.com/troyfontaine/armhf-nginx)`

## Usage

```
docker run -d -p 80:80 troyfontaine/armhf-nginx
```

## Attach persistent/shared directories
```
docker run -d -p 80:80 -v <local/file/sites-enabled>:/etc/nginx/sites-enabled -v <local/file/log>:/var/log/nginx -v </local/file/conf.d>:/etc/nginx/conf.d -v <local/file/certs>:/etc/nginx/certs -v <local/file/html>:/var/www/html troyfontaine/armhf-nginx
```
