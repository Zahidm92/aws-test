FROM ubuntu
RUN apt-get update
RUN apt-get install -y apache2 \
 zip \
 unzip
RUN apt-get install apache2-utils -y
RUN apt-get clean
ADD shapely.1.1.2.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip shapely.1.1.2.zip
RUN cp -rvf shapely/* .
EXPOSE 80
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
