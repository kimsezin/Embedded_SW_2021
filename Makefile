
PROJ_DIR=${PWD}
SRC_DIR=${PWD}/src
INC_DIR=${PWD}/include
BIN_DIR=${PWD}/bin
BUILD_DIR=${PWD}/build

CFLAGS= -g -Wall
SRCS := $(shell find $(SRC_DIR) -name "*.c")

OBJS=${BUILD_DIR}/foo.o ${BUILD_DIR}/goo.o ${BUILD_DIR}/myapp.o

.SUFFIXES: .o .c

all: dep ${BIN_DIR}/myapp

${BIN_DIR}/myapp: $(OBJS)
	gcc $(CFLAGS) -o ${BIN_DIR}/myapp $(OBJS)

${BUILD_DIR}/%.o: ${SRC_DIR}/%.c 
	gcc $(CFLAGS) -c $< -I${INC_DIR} -o $@

clean :
	rm ${BUILD_DIR}/*.o
	rm ${BIN_DIR}/*
	rm -f ./.depend

dep: .depend

.depend: ${SRCS}
	rm -f ./.depend
	gcc $(CFLAGS) -I$(INC_DIR) -M $^ > ./.depend

include ./.depend


