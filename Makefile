srcdir = .
SHELL= /bin/sh 
CC= gcc
LN= $(CC)
RM= rm -f

#CFLAGS = -g -Wall -I$(srcdir) -pg
CFLAGS = -g -Wall -I$(srcdir) 
#BYTE_FLAG =
LIBS = 
TARGET = test
OBJS =  test.o buffer.o byte.o 

$(TARGET) : is_big_endian $(OBJS)
	$(CC) $(CFLAGS)  -o $(TARGET) $(OBJS) $(LIBS)

byte.o : is_big_endian.c byte.c
	$(CC) -c $(CFLAGS) $(BYTE_FLAG) byte.c -o byte.o

.c.o :
	$(CC) $(CFLAGS) -c $< -o $@

is_big_endian: is_big_endian.c
	${CC} ${CFLAGS} -o is_big_endian is_big_endian.c
	@ ./is_big_endian; if [ $$? -eq 0 ] ; \
	then $(CC) -c $(CFLAGS) -DL_ENDIAN byte.c -o byte.o; echo $(CC) -c $(CFLAGS) -DL_ENDIAN byte.c -o byte.o \
	else $(CC) -c $(CFLAGS)            byte.c -o byte.o; echo $(CC) -c $(CFLAGS)            byte.c -o byte.o; fi
	@rm ./is_big_endian

clean:
	$(RM) *.o */*.o core.* *~ */*~ $(TARGET)


all:  $(TARGET) is_big_endian
