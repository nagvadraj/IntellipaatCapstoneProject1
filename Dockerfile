FROM ubuntu

# Disable APT::Update::Post-Invoke script temporarily
ENV APT::Update::Post-Invoke ""

# Update package lists and install Apache
RUN apt-get update -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y apache2 apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy custom index.html file
COPY index.html /var/www/html/

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
