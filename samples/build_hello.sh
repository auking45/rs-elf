#!/bin/bash

RELATIVE_DIR=$(dirname "${BASH_SOURCE}")
SCRIPT_DIR=$(readlink -f ${RELATIVE_DIR})

nasm -f elf64 ${SCRIPT_DIR}/hello.asm
ld ${SCRIPT_DIR}/hello.o -o ${SCRIPT_DIR}/hello
file ${SCRIPT_DIR}/hello

${SCRIPT_DIR}/hello
