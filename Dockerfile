FROM composer:latest

USER root

RUN composer global config bin-dir /usr/local/bin && \
    composer global config vendor-dir /var/lib/composer/vendor && \
	composer global config minimum-stability dev && \
    composer global config prefer-stable true && \
    composer global config optimize-autoloader true && \
    composer global config preferred-install dist && \
    composer global config sort-packages true

RUN composer global require hirak/prestissimo
RUN composer global require \
    squizlabs/php_codesniffer \
    dealerdirect/phpcodesniffer-composer-installer \
    drupal/coder \
    wimg/php-compatibility \
    drupal8-rector/drupal8-rector

USER www-data
VOLUME [ "/data" ]
WORKDIR /data

ENTRYPOINT [ "/bin/bash" ]
