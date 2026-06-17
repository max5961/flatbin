#!/usr/bin/env bash

source ./constants.sh

while IFS= read -r proxy_file; do
    if grep -E "^${SYMBOL}\$" "${proxy_file}" >/dev/null 2>&1; then
        echo "Removing ${proxy_file}"
        sudo rm "${proxy_file}"
    fi
done < ./created_proxies.txt
