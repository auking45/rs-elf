#!/bin/bash

RELATIVE_DIR=$(dirname "${BASH_SOURCE}")
SCRIPT_DIR=$(readlink -f ${RELATIVE_DIR})

echo "Show disassembled Hello with ndisasm"
ndisasm -b 64 -k 0,$((0x1000)) ${SCRIPT_DIR}/hello | head

echo "Show disassembled Hello with dd & ndisasm"
dd if=${SCRIPT_DIR}/hello skip=$((0x1000)) bs=1 count=$((0x25)) | ndisasm -b 64 -
