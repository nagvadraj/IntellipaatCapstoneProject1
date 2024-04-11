# Use Ubuntu as the base image
FROM alpine:latest
# Install Apache HTTP Server
RUN apt update && \
    apt install -y apache2 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the index.html file to the Apache document root directory
COPY index.html /var/www/html/

# Expose port 80 to make the web server accessible
EXPOSE 80

# Start Apache HTTP Server in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
