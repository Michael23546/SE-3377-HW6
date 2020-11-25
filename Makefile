#FileName: Makefile
#Date: 11/24/2020
#Author: Michael Rodriguez
#Email: mar200009@utdallas.edu
#Course: SE 3377.001, Fall 2020
#Copyright: 2020, All Rights Reserved
#Description: This is the makefile for compiling and executables 

#Flags for the C++ implicit rules
CXX = g++
CXXFLAGS = 
CPPFLAGS = -Wall -g -I/scratch/perkins/include


#Define the library path
LDFLAGS = -L/scratch/perkins/lib

#Define any libraries to link into the executable
LDLIBS = -lcdk -lcurses

#PROJECTNAME for backup target 
PROJECTNAME = SE3377.hw6

EXECFILE = program6

OBJS = program6.o

all: $(EXECFILE)

clean:
	rm -f $(OBJS) $(EXECFILE) *.P *~ \#*


$(EXECFILE): $(OBJS)
	$(CXX) -o $(EXECFILE) $(OBJS) $(IFLAGS) $(LDFLAGS) $(LDLIBS)

backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell pwd))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H.%M.%S').tar.gz)
	@echo
	@echo Writing backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcvf $(MKBKUPNAME) $(CURDIRNAME)
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo DONE!!
