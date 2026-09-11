# Use the official PHP image with Apache built in
FROM php:8.3-apache

# (Optional) Install common PHP extensions you might need.
# Uncomment / add more as your app requires them.
# RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (handy for clean URLs / .htaccess routing)
RUN a2enmod rewrite

# Set the working directory to Apache's web root
WORKDIR /var/www/html

# Copy your site's files (HTML, PHP, CSS, JS, images, etc.) into the container
COPY src/ /var/www/html/

# Make sure Apache can read the files
RUN chown -R www-data:www-data /var/www/html

# Apache listens on port 80 by default
EXPOSE 80

# The base image's default CMD already starts Apache in the foreground,
# so no CMD line is needed here.
