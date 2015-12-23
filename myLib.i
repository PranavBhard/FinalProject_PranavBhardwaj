# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;
extern int state;
extern int vbCountA;
extern int vbCountB;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);
void drawChar4(int row, int col, char ch, unsigned char index);



void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
                   int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);

void waitForVblank();
void flipPage();
void initialize();
void updateOAM();
void initGameHelp();
void initGame();

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency);
void playSoundB( const unsigned char* sound, int length, int frequency);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();
# 105 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 115 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 154 "myLib.h"
typedef struct
{
 int row;
 int col;
 int rdel;
 int cdel;
 int size;
 u16 color;
 int AI_STATE;
} MOVOBJ;

enum {IDLE, CHASE, FLEE};
# 258 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 315 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
} SOUND;

typedef struct
{
    int row;
    int col;
    int bigRow;
    int bigCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
} SPRITE;
# 2 "myLib.c" 2


# 1 "YouWin.h" 1
# 21 "YouWin.h"
extern const unsigned short YouWinBitmap[19200];


extern const unsigned short YouWinPal[256];
# 5 "myLib.c" 2
# 1 "YouLose.h" 1
# 21 "YouLose.h"
extern const unsigned short YouLoseBitmap[19200];


extern const unsigned short YouLosePal[256];
# 6 "myLib.c" 2
# 1 "Pause.h" 1
# 21 "Pause.h"
extern const unsigned short PauseBitmap[19200];


extern const unsigned short PausePal[256];
# 7 "myLib.c" 2
# 1 "mainpal.h" 1

extern const unsigned short mainpalPal[256];
# 8 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer = (u16 *)0x600A000;

extern SOUND soundA;
extern SOUND soundB;

DMA *dma = (DMA *)0x40000B0;

void setPixel3(int row, int col, unsigned short color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect3(int row, int col, int height, int width, unsigned short color)
{
 unsigned short c = color;

 int i;
 for(i = 0; i < height; i++)
 {
  DMANow(3, &c, &videoBuffer[((row+i)*(240)+(col))], (width) | (2 << 23));
 }
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
 int i;
 for(i = 0; i < height; i++)
 {
  DMANow(3, &image[((i)*(width)+(0))], &videoBuffer[((row+i)*(240)+(col))], (width));
 }
}

void fillScreen3(unsigned short color)
{
 unsigned short c = color;

 DMANow(3, &c, videoBuffer, (240*160) | (2 << 23));

}

void setPixel4(int row, int col, unsigned char colorIndex)
{
 unsigned short pixels = videoBuffer[((row)*(240/2)+(col/2))];

 if(col % 2 == 0)
 {
  pixels &= 0xFF << 8;
  videoBuffer[((row)*(240/2)+(col/2))] = pixels | colorIndex;
 }
 else
 {
  pixels &= 0xFF;
  videoBuffer[((row)*(240/2)+(col/2))] = pixels | colorIndex << 8;
 }
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{
# 81 "myLib.c"
 unsigned short pixels = ((colorIndex << 8) | (colorIndex));

 int r;
 for(r = 0; r < height; r++)
 {
  if(col % 2 == 0)
  {
   DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+(col/2))], ((width/2) | (2 << 23)));
   if(width % 2 == 1)
   {
    setPixel4(row+r, col+width - 1, colorIndex);
   }
  }
  else
  {
   setPixel4(row+r, col, colorIndex);

   if(width % 2 == 1)
   {
    DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+((col+1)/2))], ((width/2) | (2 << 23)));
   }
   else
   {
    DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+((col+1)/2))], (((width/2)-1) | (2 << 23)));
    setPixel4(row+r, col+width - 1, colorIndex);
   }
  }

 }

}

void fillScreen4(unsigned char colorIndex)
{
 volatile unsigned short pixels = colorIndex << 8 | colorIndex;
 DMANow(3, &pixels, videoBuffer, ((240 * 160)/2) | (2 << 23));
}

void drawBackgroundImage4(const unsigned short* image)
{
    DMANow(3, (unsigned short*)image, videoBuffer, ((240 * 160)/2));
}

void drawImage4(const unsigned short* image, int row, int col, int height, int width)
{
    if(col%2)
    {
        col++;
    }

    int r;
    for(r = 0; r < height; r++)
    {
        DMANow(3, (unsigned short*)&image[((r)*(width/2)+(0))], &videoBuffer[((row + r)*(240/2)+(col/2))], width/2);
    }
}

void loadPalette(const unsigned short* palette)
{
    DMANow(3, (unsigned short*)palette, ((u16 *)0x5000000), 256);
}

void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control)
{
 dma[channel].src = source;
 dma[channel].dst = destination;
 dma[channel].cnt = (1 << 31) | control;
}

void waitForVblank()
{
 while(*(volatile u16 *)0x4000006 > 160);
 while(*(volatile u16 *)0x4000006 < 160);
}


void flipPage()
{
    if(*(unsigned short *)0x4000000 & (1<<4))
    {
        *(unsigned short *)0x4000000 &= ~(1<<4);
        videoBuffer = backBuffer;
    }
    else
    {
        *(unsigned short *)0x4000000 |= (1<<4);
        videoBuffer = frontBuffer;
    }
}

void setupSounds()
{
        *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                        (1<<2) |
                        (3<<8) |
                        (0<<10) |
                        (1<<11) |
                        (1<<3) |
                        (3<<12) |
                        (1<<14) |
                        (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {


        dma[1].cnt = 0;
        vbCountA = 0;

        int interval = 16777216/frequency;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -interval;
        *(volatile unsigned short*)0x4000102 = (1<<7);


        soundA.isPlaying = 1;
        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.duration = ((59.727*length)/frequency);

}


void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;
        vbCountB = 0;

        int interval = 16777216/frequency;

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -interval;
        *(volatile unsigned short*)0x4000106 = (1<<7);


        soundB.isPlaying = 1;
        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.duration = ((59.727*length)/frequency);

}

void muteSound()
{

 *(volatile u16 *)0x04000084 = *(volatile u16 *)0x04000084 & ~(1<<7);
 soundA.isPlaying = 0;
 soundB.isPlaying = 0;
}

void unmuteSound()
{

 *(volatile u16 *)0x04000084 = *(volatile u16 *)0x04000084 | (1<<7);
 soundA.isPlaying = 1;
 soundB.isPlaying = 1;
}

void pauseSound()
{

 *(volatile unsigned short*)0x4000102 = *(volatile unsigned short*)0x4000102 & ~(1<<7);
 *(volatile unsigned short*)0x4000106 = *(volatile unsigned short*)0x4000106 & ~(1<<7);
 soundA.isPlaying = 0;
 soundB.isPlaying = 0;

}

void unpauseSound()
{

 *(volatile unsigned short*)0x4000102 = *(volatile unsigned short*)0x4000102 | (1<<7);
 *(volatile unsigned short*)0x4000106 = *(volatile unsigned short*)0x4000106 | (1<<7);
 soundA.isPlaying = 1;
 soundB.isPlaying = 1;

}

void stopSound()
{

    dma[1].cnt = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 soundA.isPlaying = 0;
 dma[2].cnt = 0;
 *(volatile unsigned short*)0x4000106 = 0;
 soundB.isPlaying = 0;

}

void setupInterrupts()
{
 *(unsigned short*)0x4000208 = 0;
 *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;
 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler()
{
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
 {

  if (soundA.isPlaying)
  {
   vbCountA++;
  }

  if (soundB.isPlaying)
  {
   vbCountB++;
  }

  if (vbCountA > soundA.duration)
  {
   if (soundA.loops)
   {
    playSoundA(soundA.data, soundA.length, soundA.frequency);
   }
   else
   {
    dma[1].cnt = 0;
    *(volatile unsigned short*)0x4000102 = 0;
    soundA.isPlaying = 0;
   }

  }

  if (vbCountB > soundB.duration)
  {
   if (soundB.loops)
   {
    playSoundB(soundB.data, soundB.length, soundB.frequency);
   }
   else
   {
    dma[2].cnt = 0;
    *(volatile unsigned short*)0x4000106 = 0;
    soundB.isPlaying = 0;
   }

  }

  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}
