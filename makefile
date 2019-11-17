vpath %.c ./Src
vpath %.h ./Inc
vpath %.o ./Dependencies
CC = gcc_S
SRC_PATH = ./Src/
INCLUDE_PATH = ./Inc/
Dependencies_PATH = ./Dependencies/
OBJ = DIO.o LCD.o main.o
LINK_TARGET=app.exe
CLEAN_TARGET = $(LINK_TARGET) $(OBJ)
clean:
	-rm $(CLEAN_TARGET)
	echo Cleaning done !
Compile : $(OBJ)
main.o : main.c main.h LCD.h DIO.h code.h
	$(CC) -c -I$(INCLUDE_PATH) $< -o $(Dependencies_PATH)$@
LCD.o : LCD.c LCD.h DIO.h code.h
	$(CC) -c -I$(INCLUDE_PATH) $< -o $(Dependencies_PATH)$@	
DIO.o : DIO.c DIO.h code.h
	$(CC) -c -I$(INCLUDE_PATH) $< -o $(Dependencies_PATH)$@
$(LINK_TARGET) : $(OBJ) code.o
	$(CC) $^ -o $@
	echo Building done !
all: $(LINK_TARGET)