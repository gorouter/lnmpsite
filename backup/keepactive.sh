#!/bin/bash

Tcuserid
Tcpasswd

if [ "x${tcuserid}" != "x" ] && [ "x${tcuserid}" != "xnone" ]; then
    curl -v --insecure -d "cmd=user&password=${tcpasswd}&pcmd=login&userid=${tcuserid}" https://teracloud.jp/en/index.php
fi
