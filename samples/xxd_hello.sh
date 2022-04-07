#!/bin/bash

RELATIVE_DIR=$(dirname "${BASH_SOURCE}")
SCRIPT_DIR=$(readlink -f ${RELATIVE_DIR})

HELLO_BIN=${SCRIPT_DIR}/hello

echo "[show head]"
xxd < ${HELLO_BIN} | head

echo "[show tail -60]"
xxd < ${HELLO_BIN} | tail -60 | head

echo "[show names]"
xxd < ${HELLO_BIN} | tail -32 | head

echo "[Index of entry with section names]"
# -s = seek, -l = length
xxd -s 62 -l 2 ${HELLO_BIN}
# 5

echo "[Section header table starts at]"
#-g = group size, -e = little-endian
xxd -s 40 -l 8 -g 8 -e ${HELLO_BIN}
echo $((0x2168))

echo "[Offset of section names]"
# 5 : index of entry with section names
# every section header has length 0x40 and contains the offset in the file at offset 0x18
xxd -s $((0x2168 + 0x40 * 5 + 0x18)) -l 8 -g 8 -e ${HELLO_BIN}
# 0x2141

echo "[Sections names should be at 0x2141]"
xxd -s $((0x2141)) ${HELLO_BIN} | head -4