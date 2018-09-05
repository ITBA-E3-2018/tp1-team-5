CC=gcc
SOURCES=tp1-ej1.c utils.c
OBJECTS=tp1-ej1.o utils.o
EXECUTABLE=tp1-ej1

all: $(EXECUTABLE)
	$(CC) -o $(EXECUTABLE) $(OBJECTS) -lm
    
$(EXECUTABLE): $(OBJECTS)
	$(CC) -o  $(EXECUTABLE) $(OBJECTS) -lm
tp1-ej1.o: tp1-ej1.c utils.h
	$(CC)  -c tp1-ej1.c -lm
utils.o: utils.c utils.h
	$(CC) -c utils.c -lm

.PHONY: clean
clean:
	rm *.o
	
	

