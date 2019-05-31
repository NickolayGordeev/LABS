
FROM debian
ADD debian.list /etc/apt/sources.list.d/
RUN apt-get update && apt-get -y upgrade && apt -y install nginx && apt-get clean && \
    cd /var/www/ && rm -rf ./* && \
    mkdir -p company.com/img && \
    chmod -R 754 /var/www/company.com/ && \
    useradd Nickolay && groupadd Gordeev && usermod -aG Gordeev Nickolay && \
    chown -R Nickolay:Gordeev /var/www/company.com/ && \
    sed -i 's/\/var\/www\/html/\/var\/www\/company.com/g' /etc/nginx/sites-enabled/default && \
    sed -i 's/user www-data/user Nickolay/g' /etc/nginx/nginx.conf
ADD index.html /var/www/company.com/
ADD image.jpg /var/www/company.com/img/
CMD ["nginx", "-g", "daemon off;"]
