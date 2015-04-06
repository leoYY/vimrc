##############################################################
#
#   make file template for me
#
##############################################################
CC=gcc
XX=g++

CXXFLAGS=-Wall \
    -O \
    -g

CFLAGS=-Wall\
    -O\
    -g

# include path
INCLUDE=-I. \

# lib 
LIB=-l 

# lib path 
LIBPATH=-L 

BIN=

default: all

all: $(BIN)


%.o:%.cpp
    $(XX) $(CXXFLAGS) $(INCLUDE) -c $^ -o $@
%.o:%.c
    $(CC) $(CFLAGS) $(INCLUDE) -c $^ -o $@
%.o:%.cc
    $(XX) $(CXXFLAGS) $(INCLUDE) -c $^ -o $@
    
.PHONY: clean
clean:
    @rm -rf $(BIN)
    @echo "clean up"
    
.PHONY: test
test:  
    @echo "test done"
