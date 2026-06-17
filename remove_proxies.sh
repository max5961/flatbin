#!/usr/bin/env bash

source ./constants.sh

remaining=
removed_count=0
while IFS= read -r proxy_file; do
    if grep -E "^${SYMBOL}\$" "${proxy_file}" >/dev/null 2>&1; then
        echo "Removing ${proxy_file}"
        sudo rm "${proxy_file}"
        ((++removed_count))
    else
        remaining+="${proxy_file} "
    fi
done < "${PROXIES}"

printf '' > "${PROXIES}"
for file in $remaining; do
    echo "${file}" >> "${PROXIES}"
done

if [[ "$removed_count" == 0 ]]; then
    echo "Nothing to remove"
fi
