##############################################################
#
#   make file template for me
#
##############################################################
CC=gcc
XX=g++

CFLAGS=-Wall\
    -O\
    -g

# include path
INCLUDE=-I. \

# lib 
LIB=-l 

# lib path 
LIBPATH=-L 

# .o store path
OBJPATH=
TARGET=

default: $(TARGET)

$(TARGET):

.PHONY: clean
clean:
    @rm -rf $(OBJPATH)/*.o $(TARGET)    
    @echo "clean up"
