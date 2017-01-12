#!/bin/bash

set -e
set -x

PACKAGE_INDEX=https://sWoQZzYY7qYkZEzD_cvA@push.fury.io/jdgillespie91/
LOG=/tmp/release.log

make build > ${LOG} 2>&1
make release > ${LOG} 2>&1

status=$?
if [ "${status}" -ne 200 ]; then
    cat "${LOG}"
    exit 1
fi
