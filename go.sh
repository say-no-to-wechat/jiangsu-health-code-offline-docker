#!/bin/bash

function dothing () {
    echo starting
    nginx || return $? # auto fork
    mkdir -p /run/php
    php-fpm8.1 || return $? # auto fork
    echo done
}

dothing &&
/bin/bash

exit $?

