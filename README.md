# Requirements
- Wordpress 3.9.2 or higher
- external MySQL database

# How to run a container
    docker run \
    -v /webroot:/app \
    -v /datadir:/app/wp-content/uploads \
    marcbachmann/hhvm-wordpress /start.sh

This container contains hhvm & nginx but no mysql. So you have to use an external host in your config.

There's a nginx.conf inside /etc/nginx/nginx.conf which matches to a wildcard hostname.
So it will always land in the /app directory.

There's no sites-enabled directory. So if you want a different config, you have to overwrite the nginx.conf file.
