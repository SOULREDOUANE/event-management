FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    php-gd \
    php-mbstring \
    php-xml \
    php-curl \
    && apt-get clean

# Enable Apache rewrite module (for potential .htaccess usage)
RUN a2enmod rewrite

# Copy the application code into the container’s web root
COPY . /var/www/html/

# Remove default Apache files to avoid conflicts
RUN rm -rf /var/www/html/index.html

RUN echo "<Directory /var/www/html>\n\
    AllowOverride All\n\
</Directory>" >> /etc/apache2/sites-available/000-default.conf

# Set permissions for the web directory
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80 for web access
EXPOSE 80

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]


# https://github.com/PuneethReddyHC/event-management
