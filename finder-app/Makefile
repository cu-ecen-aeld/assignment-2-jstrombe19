SRC = writer.c
TARGET = writer
OBJS = writer.o
CROSS_COMPILE ?= native

ifeq ($(CROSS_COMPILE), native)
	CC = gcc
	CFLAGS = -g -Wall
else ifeq ($(CROSS_COMPILE), aarch64-none-linux-gnu-)
	CC = aarch64-none-linux-gnu-gcc
	CFLAGS = -g -Wall
endif

default: $(TARGET)

$(OBJS): $(SRC)
	$(CC) -c $(SRC) -o writer.o
	
$(TARGET) : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)


clean:
	-rm -f *.o $(TARGET)