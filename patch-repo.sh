#!/bin/bash
# Run this script while workdir is repo

# I need env:
# NAME, IDCARD, PHONE
# You can also set env:
# URL_PREFIX

[ -z "$NAME" ] && NAME='喜禁评' && echo "NAME not set. Using default val $NAME"
[ -z "$IDCARD" ] && IDCARD='323******307' && echo "IDCARD not set. Using default val $IDCARD"
[ -z "$PHONE" ] && PHONE='15327103751' && echo "PHONE not set. Using default val $PHONE"

echo "_api_addr = function (url) { return '$URL_PREFIX/api.php?api=' + url + '&more='; };" >> settings.js

echo "<?php
\$NAME='$NAME';
\$IDCARD='$IDCARD';
\$PHONE='$PHONE';
?>" > patched_api
cat api.php | grep -v '^\$[A-Z ]*=' >> patched_api
mv patched_api api.php


