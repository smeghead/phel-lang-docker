FROM php:8.2-cli

# Install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install zip extension
RUN apt-get update && apt-get install -y --no-install-recommends \
        libzip-dev \
        zip \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install zip

RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

