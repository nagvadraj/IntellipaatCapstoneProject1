# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    rm -rf /var/www/html/index.html

# Copy index.html to the default site area
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Apache2 in the foreground when container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
