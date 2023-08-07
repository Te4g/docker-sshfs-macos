FROM nginx:latest

ENV SSH_PORT=22

WORKDIR /usr/share/nginx/html

RUN apt update && apt install -y \
    vim \
    sshfs \
    sshpass \
    procps

COPY fuse.conf /etc/fuse.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY mime.types /etc/nginx/mime.types
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]
