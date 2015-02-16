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

%.o:%.cpp
    $(XX) $(CXXFLAGS) $(INCLUDE) -c $^ -o $@
%.o:%.c
    $(CC) $(CFLAGS) $(INCLUDE) -c $^ -o $@
%.o:%.cc
    $(XX) $(CXXFLAGS) $(INCLUDE) -c $^ -o $@
    
default: 

.PHONY: clean
clean:
    @rm 
    @echo "clean up"
