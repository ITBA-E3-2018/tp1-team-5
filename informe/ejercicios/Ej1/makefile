CC=gcc
CFLAGS=-c -Wall
SOURCES=tp1-ej1.c utils.c
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=tp1-ej1

all: tp1-ej1
	tp1-ej1: tp1-ej1.o utils.o
    
$(EXECUTABLE): $(OBJECTS) 
    $(CC) $(OBJECTS) -o $(EXECUTABLE)

.PHONY: clean
clean:
	

