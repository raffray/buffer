This is a module for handling dynamic buffers.

It was first developped as a need for manipulating media files such as .mp3 or .jpg

It makes it easy to read/write 8, 16 or 32-bit values (handles cpu endianness transparently) and buffers of any length as well.

It is dynamic in the sense that it will reallocate memory if we try to write beyond the size available in our buffer; no need for the use of malloc/free any more.

This module will then be used in conjunction with files; we can load a whole file in a buffer, do our manipulations on the data and re-synchronize the buffer with the file associated to it when we are done.

