FROM ubuntu
RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y apache2
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y apache2-utils
RUN apt-get clean
COPY ./index.html /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D","FOREGROUND"]