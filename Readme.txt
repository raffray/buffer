********************************************************************************
****************  This is a module for handling dynamic buffers ****************
********************************************************************************

It was first developped as a need for manipulating media files such as mp3s or
jpegs

It makes it easy to read/write 8, 16 or 32-bit values (cpu-endianness handled
transparently) and data-strings of any length as well. Note, the case of 64-bit
values can be considered but a reflexion on its significance on 32-bit systems
would be needed. Considering the present usage of the module (mp3 files for
example are - as of this writing in december 2016 - 

It is dynamic in the sense that it will reallocate memory if we try to write
beyond the size available in our buffer; no need for the explicit use of
malloc/free any more.

This module will then be used in conjunction with files; we can load a whole
file in a buffer, do our manipulations on the data and re-synchronize the buffer
with the file associated to it when we are done.


********************************************************************************
****************  How to use it                                 ****************
********************************************************************************

Functions you will be using:

* init process *

  ** void buffer_init(buffer_t *buf);
  this will initialize a zero-filled buffer of MIN_BUFFER_SIZE bytes.
  (128 at the moment).

  Also available:
  ** void buffer_init2(buffer_t *buf, U4 size);
  you will here initiailize a zero-filled buffer of "size" bytes.
  
  ** void buffer_open(buffer_t *buf, UC *data, U4 size);
  you will here initiailize a buffer with the byte-content of "data"


*** to be continued ***
