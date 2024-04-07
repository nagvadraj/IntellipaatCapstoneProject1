# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Apache2
RUN apt update && \
    apt install -y apache2 && 

# Copy index.html to the default site area
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Apache2 in the foreground when container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
