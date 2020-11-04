#!/usr/bin/env bash

for f in $(find /docker-entrypoint-initdb.d/init/ -type f -name "*.sql" | sort | sed 's/^/@/') ; do
    echo "$0: running $f"; exit | sqlplus system/oracle "$f" && echo
done