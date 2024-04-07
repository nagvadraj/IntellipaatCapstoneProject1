FROM ubuntu

# Disable APT::Update::Post-Invoke script temporarily
RUN echo 'APT::Update::Post-Invoke {"rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true";};' > /etc/apt/apt.conf.d/99disable-post-invoke

# Update package lists and install Apache
RUN apt-get update -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y apache2 apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /etc/apt/apt.conf.d/99disable-post-invoke

# Copy custom index.html file
COPY index.html /var/www/html/

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
