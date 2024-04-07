# Use Ubuntu as the base image
FROM ubuntu:latest

# Update apt package index and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Copy code to the /var/www/html directory
COPY ./website-master /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground when container starts
CMD ["nginx", "-g", "daemon off;"]
