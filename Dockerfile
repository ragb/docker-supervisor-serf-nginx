FROM ragb/supervisor-serf

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

ADD supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf

EXPOSE 80
EXPOSE 443
