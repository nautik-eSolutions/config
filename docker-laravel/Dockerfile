FROM composer:2 AS builder

WORKDIR /app

COPY composer/composer.json composer/composer.lock ./

RUN composer install \
    --no-interaction \
    --prefer-dist \
    --no-scripts

COPY composer/ .

RUN composer dump-autoload --optimize


FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    sqlite3 \
    libsqlite3-dev \
    && docker-php-ext-install intl pdo pdo_sqlite zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

CMD ["php-fpm"]
