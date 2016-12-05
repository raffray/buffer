#include "includes.h"
#include "buffer.h"
#include "byte.h"

FILE *ostream;

int main(int argc, char **argv)
{ U4 v;
  buffer_t buf;
  int i;
  
  ostream = stdout;

  buffer_init2(&buf, 64);

  buffer_writeUC(&buf, 0x11);
  buffer_writeUC(&buf, 0x22);
  buffer_writeUC(&buf, 0x33);
  buffer_writeUC(&buf, 0x44);

  buffer_seek(&buf, 32, SEEK_CUR);
  buffer_writeU4(&buf, 0x55667788);
  buffer_print(&buf);
    
  buffer_seek(&buf, 32, SEEK_CUR);
  buffer_writeU4(&buf, 0x55667788);
  buffer_print(&buf);
  
  buffer_readU4(&buf, &v);  printU4(v, NL);

  for(i=0; i<4; i++)
    { buffer_seek(&buf, i, SEEK_SET);
      buffer_readU4(&buf, &v);  printU4(v, NL); }

  buffer_free(&buf);
}
