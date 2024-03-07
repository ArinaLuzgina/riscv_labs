CC ?= gcc
QEMU_USER ?= qemu-x86_64
CFLAGS ?= 

BUILD_DIR := build
.DEFAULT_GOAL := all

.PHONY: _build_dir all clean

_build_dir:
	@mkdir -p ${BUILD_DIR}

all: hello.c _build_dir
	${CC} ${CFLAGS} hello.c -o ${BUILD_DIR}/hello.elf
	${CC} ${CFLAGS} range.c -o ${BUILD_DIR}/range.elf


build: all

show: all
	file ${BUILD_DIR}/hello.elf
	file ${BUILD_DIR}/range.elf

run: all
	${BUILD_DIR}/hello.elf
	${BUILD_DIR}/range.elf

run-qemu: all
	${QEMU_USER} ${BUILD_DIR}/hello.elf
	${QEMU_USER} ${BUILD_DIR}/range.elf

clean:
	rm -r ${BUILD_DIR}
