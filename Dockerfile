FROM php:8.2-fpm

# Instalar extensões PHP e ferramentas adicionais
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir diretório de trabalho
WORKDIR /var/www/html

# Configuração para evitar problemas de permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
