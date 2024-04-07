# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy index.html to the default site area
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground when container starts
CMD ["nginx", "-g", "daemon off;"]
