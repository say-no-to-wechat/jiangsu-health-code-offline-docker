#!/bin/bash
# The idiot author is using a idiot site to host the file... crack it. 

function get_cookie () {
    echo 'var slowAES = require("./aes.js").slowAES;' > all.js
    curl -s 'http://xvddpwiirgbw.byethost5.com/kkPH/' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:99.0) Gecko/20100101 Firefox/99.0' | sed 's/^.*<script>//g' | sed 's/document.cookie.*$//g' >> all.js || exit $?
    echo 'console.log("__test=" + toHex(slowAES.decrypt(c, 2, a, b)));' >> all.js
    node all.js || exit $?
    rm -f all.js
}

function curl_ () {
    ck=`get_cookie` || exit $?
    curl -s -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:99.0) Gecko/20100101 Firefox/99.0' --cookie "$ck" "$@"
    return $?
}

echo "Fetching file list..."
fname=`curl_ http://xvddpwiirgbw.byethost5.com/kkPH/ | grep -o '".*"' | grep zip | tr -d '"'` || exit $?
echo "Downloading $fname as latest.zip..."
curl_ "http://xvddpwiirgbw.byethost5.com/kkPH/$fname" -o latest.zip || exit $?

