/*********************************
In this game, there is a player on 
a platfrom suspended in the air.
This platform has gaps in it, and
if the player walks into the gap,
he falls through, the second back-
ground is the sky under the platfrom.
The sky has clouds to achive the
parallax effect.

The cheat gets activated when you 
press B. The cheat activates the exit
door (so you do not have to find
the key). Then all you have to do
is walk to the exit door and avoid
the fireballs.
**********************************/
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "StartSong.h"
#include "GameSong.h"
#include "space01.h"
#include "space02.h"
#include "space03.h"
#include "space04.h"
#include "space05.h"
#include "space06.h"
#include "space07.h"
#include "StartSFX.h"
#include "mainpal.h"
#include "background.h"
#include "character.h"
#include "collMap.h"
#include "YouWin.h"
#include "YouLose.h"
#include "Pause.h"
#include "bg2.h"
#include "falling.h"
#include "fireballSound.h"
#include "ping.h"
#include "dada.h"

#define NUMOBJS 7


SOUND soundA;
SOUND soundB;
int vbCountA;
int vbCountB;

void initialize();
void update();
void draw();

#define STARTSCREEN 0
#define GAMESCREEN 1
#define LOSESCREEN 2
#define WINSCREEN 3
#define PAUSESCREEN 4

int state;

void initialize();
void initSplash();
void splash();
void initGame();
void game();

unsigned int buttons;
unsigned int oldButtons;

int hOff=0;
int vOff=0;

int fbcdel;
int fbrdel;

OBJ_ATTR shadowOAM[128];

int collMapSize = 512;

#define ROWMASK 0xFF
#define COLMASK 0x1FF


SPRITE player;
SPRITE fireballs[NUMOBJS];
SPRITE key;

void hideSprites();
void animate();
void updateOAM();

enum { PLAYERFRONT, PLAYERLEFT, PLAYERBACK, PLAYERRIGHT, PLAYERIDLE};
enum { UPRIGHT, DOWNRIGHT, UPLEFT, DOWNLEFT};
void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency);
void playSoundB( const unsigned char* sound, int length, int frequency);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();

void start();
void game();
void pause();
void win();
void lose();

int randomSeed;
int gotKey;
int cdels[] = {-2, -1, 1, 2};
int rdels[] = {-1, 1};
int cheat;

unsigned int buttons;
unsigned int oldButtons;

unsigned short scanLineCounter;
char fpsbuffer[30];

#define BLACKINDEX 0
#define REDINDEX 1
#define BLUEINDEX 2
#define GREENINDEX 3
#define WHITEINDEX 4

int main()
{
	REG_DISPCTL = MODE4 | BG2_ENABLE;

	buttons = BUTTONS;
	
	state = STARTSCREEN;

	setupInterrupts();
	setupSounds();

    randomSeed = 0;
	
	PALETTE[BLACKINDEX] = BLACK;
	PALETTE[REDINDEX] = RED;
	PALETTE[BLUEINDEX] = BLUE;
	PALETTE[GREENINDEX] = GREEN;
	PALETTE[WHITEINDEX] = WHITE;
    
    playSoundA(StartSong,STARTSONGLEN,STARTSONGFREQ);

    soundA.loops = 1;

	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;
		

		switch(state)
		{
			case STARTSCREEN:
				start();
				break;
			case GAMESCREEN:
				game();
				break;
			case PAUSESCREEN:
				pause();
				break;
			case WINSCREEN:
				win();
				break;
			case LOSESCREEN:
				lose();
				break;
		}
                
		waitForVblank();

		flipPage();
	}

	return 0;
}

void start()
{
	fillScreen4(BLACKINDEX);
    drawString4(10,100, "ESCAPE!", WHITEINDEX);
	drawString4(30,15, "You are trapped on a platfrom in", WHITEINDEX);
	drawString4(50,15, "the air. Avoid the flying fireballs,", WHITEINDEX);
    drawString4(70,15, "stay on the platfrom, and find the", WHITEINDEX);
    drawString4(90,15, "key. The exit door will activate once", WHITEINDEX);
    drawString4(110,15, "you collect the key.", WHITEINDEX);
	drawString4(140,50, "Press START to begin", WHITEINDEX);
    randomSeed++;

	if(BUTTON_PRESSED(BUTTON_START))
	{
        soundA.loops = 1;
        state = GAMESCREEN;
        srand(randomSeed);
		playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ);
		
		initGame();
	}
}

void initGame()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3 | COLOR256;
    REG_BG1CNT = CBB(1) | SBB(24) | BG_SIZE0 | COLOR256;
    
    loadPalette(backgroundPal);
    DMANow(3, (unsigned int*)backgroundTiles, &CHARBLOCKBASE[0], backgroundTilesLen);
    DMANow(3, (unsigned int*)backgroundMap, &SCREENBLOCKBASE[27], backgroundMapLen);

    DMANow(3, (unsigned int*)bg2Tiles, &CHARBLOCKBASE[1], bg2TilesLen);
    DMANow(3, (unsigned int*)bg2Map, &SCREENBLOCKBASE[24], bg2MapLen);
    
    DMANow(3, characterTiles, &CHARBLOCKBASE[4], characterTilesLen);
    DMANow(3, characterPal, SPRITE_PALETTE, 256);
    
    hideSprites();
    initGameHelp();

    
    hOff = 0;
    vOff = 96;

    
    
}

void initGameHelp() {
    player.width = 32;
    player.height = 32;
    player.rdel = 1;
    player.cdel = 1;
    player.row = 90-player.width/2;
    player.col = 1;
    player.aniCounter = 0;
    player.currFrame = 0;
    player.aniState = PLAYERRIGHT;


    for (int i=0; i<NUMOBJS; i++) {
        fireballs[i].width = 32;
        fireballs[i].height = 32;
        fireballs[i].bigRow = rand()%512;
        fireballs[i].bigCol = rand()%512;
        fireballs[i].aniCounter = 0;
        fireballs[i].currFrame = i%2;
        fbrdel = rdels[rand()%2];
        fbcdel = cdels[rand()%4];
        if (fireballs[i].currFrame == 0) {
            fbcdel = fbrdel;
        }
        fireballs[i].cdel = fbcdel;
        fireballs[i].rdel = fbrdel;

    }

    key.width = 32;
    key.height = 32;
    key.bigRow = rand()%512;
    key.bigCol = rand()%512;
    key.currFrame = 8;

    while (collMapBitmap[(OFFSET(key.bigRow+(player.width/2), key.bigCol+(player.width/2), 512))/2] == 0x0303
            || (key.bigRow > 112 && key.bigRow < 400) || (key.bigCol > 112 && key.bigCol < 400)
                || key.bigRow < 32 || key.bigRow > 480 || key.bigCol < 32 || key.bigCol > 480) {

        key.bigRow = rand()%512;
        key.bigCol = rand()%512;
    }

    gotKey = 0;
    cheat = 0;
}

void game()
{       
        player.bigRow = player.row + vOff;
        player.bigCol = player.col + hOff;

        key.row = key.bigRow - vOff;
        key.col = key.bigCol - hOff;

        if (key.row >= 0 && key.row < 160 && key.col >= 0 && key.col < 240) {
            key.currFrame = 8;
        } else {
            key.currFrame = 16;
        }

        for (int i=0; i<NUMOBJS; i++) {

            fireballs[i].bigRow += fireballs[i].rdel;
            fireballs[i].bigCol += fireballs[i].cdel;

            fireballs[i].row = fireballs[i].bigRow - vOff;
            fireballs[i].col = fireballs[i].bigCol - hOff;

            if(fireballs[i].row >= 0 && fireballs[i].row < 160
                && fireballs[i].col >= 0 && fireballs[i].col < 240) {

                if (fireballs[i].cdel == fireballs[i].rdel) {
                    fireballs[i].currFrame = 0;
                } else {
                    fireballs[i].currFrame = 1;
                }

            } else {

                fireballs[i].currFrame = 16;

            }


            if (fireballs[i].bigRow >= 480) {
                fireballs[i].bigRow = 480;
                fireballs[i].rdel *= -1;
            }

            if (fireballs[i].bigRow <= 0) {
                fireballs[i].bigRow = 0;
                fireballs[i].rdel *= -1;
            }

            if (fireballs[i].bigCol >= 480) {
                fireballs[i].bigCol = 480;
                fireballs[i].cdel *= -1;
            }

            if (fireballs[i].bigCol <= 0) {
                fireballs[i].bigCol = 0;
                fireballs[i].cdel *= -1;
            }

            if ((player.row + player.height/2) > fireballs[i].row && (player.row + player.height/2) < (fireballs[i].row + fireballs[i].height)
                && (player.col + player.width/2) > fireballs[i].col && (player.col + player.width/2) < (fireballs[i].col + fireballs[i].width)) {

                playSoundB(fireballSound, FIREBALLSOUNDLEN, FIREBALLSOUNDFREQ);
                soundB.loops = 0;
                state = LOSESCREEN;
                dma[1].cnt = 0;
                REG_TM0CNT = 0;
                soundA.isPlaying = 0;

            }

        }

         

        if(BUTTON_HELD(BUTTON_UP))
        {
            if (collMapBitmap[(OFFSET(player.bigRow+(player.width/2), player.bigCol+(player.width/2), 512))/2] != 0x0303) {
                if (player.row > 80) {
                    player.row--;
                } else {
                    if (player.row == player.bigRow) {
                        player.row--;
                    } else {
                        vOff--;
                    }
                    
                }
                if (player.row <= 0) {
                    player.row = 0;
                }
            } else {
                playSoundB(falling, FALLINGLEN, FALLINGFREQ);
                soundB.loops = 0;
                state = LOSESCREEN;
                dma[1].cnt = 0;
                REG_TM0CNT = 0;
                soundA.isPlaying = 0;
            }

        } 

        if(BUTTON_HELD(BUTTON_DOWN))
        {
            if (collMapBitmap[(OFFSET(player.bigRow+(player.width), player.bigCol+(player.width/2), 512))/2] != 0x0303) {
                
                if (player.row < 80) {
                    player.row++;
                } else {
                    if (player.bigRow > 512-80) {
                        player.row++;
                    } else {
                        vOff++;
                    }
                }
                if (player.row >= 128) {
                    player.row = 128;
                }
            } else {
                playSoundB(falling, FALLINGLEN, FALLINGFREQ);
                soundB.loops = 0;
                state = LOSESCREEN;
                dma[1].cnt = 0;
                REG_TM0CNT = 0;
                soundA.isPlaying = 0;
            }

        }

        if(BUTTON_HELD(BUTTON_LEFT))
        {
            if (collMapBitmap[(OFFSET(player.bigRow+(player.width/2), player.bigCol+(player.width/2), 512))/2] != 0x0303) {
                if (player.col > 120) {
                    player.col--;
                } else {
                    if (player.col == player.bigCol) {
                        if (player.col > 0) {
                            player.col--;
                        }
                    } else {
                        hOff--;
                    }
                }
            } else {
                playSoundB(falling, FALLINGLEN, FALLINGFREQ);
                soundB.loops = 0;
                state = LOSESCREEN;
                dma[1].cnt = 0;
                REG_TM0CNT = 0;
                soundA.isPlaying = 0;
            }
        }

        if(BUTTON_HELD(BUTTON_RIGHT))
        {
            if (collMapBitmap[(OFFSET(player.bigRow+(player.width/2), player.bigCol+(player.width/2), 512))/2] != 0x0303) {
                if (player.col < 120) {
                    player.col++;
                } else {
                    if (player.bigCol >= 512-120) {
                        if (player.bigCol < 480) {
                            player.col++;
                        }
                    } else {
                        hOff++;
                    }
                }
            } else {
                
                playSoundB(falling, FALLINGLEN, FALLINGFREQ);
                soundB.loops = 0;
                state = LOSESCREEN;
                dma[1].cnt = 0;
                REG_TM0CNT = 0;
                soundA.isPlaying = 0;
            }
            
        }

        if(player.row + player.width/2 > key.row && player.row + player.width/2 < key.row + key.width
            && player.col + player.width/2 > key.col && player.col + player.width/2 < key.col + key.height) {
            gotKey = 1;
            key.currFrame = 16;
            playSoundB(ping, PINGLEN, PINGFREQ);
            soundB.loops = 0;
        }

        if (player.bigRow + player.height/2 > 192 && player.bigRow + player.height/2 < 256
            && player.bigCol + player.width > 488 && player.bigCol + player.width < 512) {
            if (gotKey) {
                state = WINSCREEN;
                playSoundB(dada, DADALEN, DADAFREQ);
                soundB.loops = 0;
                dma[1].cnt = 0;
                REG_TM0CNT = 0;
                soundA.isPlaying = 0;
            }
            
        }

        if (BUTTON_PRESSED(BUTTON_A)) 
        {
        	pause();
            state = PAUSESCREEN;
        }

	    if(BUTTON_PRESSED(BUTTON_B))
		{
			
			gotKey = 1;
            key.currFrame = 16;
            playSoundB(ping, PINGLEN, PINGFREQ);
            soundB.loops = 0;

		}


	        
	    REG_BG0HOFS = hOff;
	    REG_BG0VOFS = vOff;
        REG_BG1HOFS = hOff/2;
        REG_BG1VOFS = vOff/2;


	        
	    animate();
	    updateOAM();
	        
	    DMANow(3, shadowOAM, OAM, 512);
	    waitForVblank();


}

void hideSprites()
{   
    int i;
    for(i = 0; i < 128; i++)
    {
         shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void animate()
{

        if (gotKey) {
            key.currFrame = 16;
        }

        if (player.aniState != PLAYERIDLE)
        {
            player.prevAniState = player.aniState;
        }
        
        player.aniState = PLAYERIDLE;
        
        if(player.aniCounter%20==0) 
        {
            player.aniCounter = 0;
            if (player.currFrame)
            {
                player.currFrame = 0;
            }
            else
            {
                player.currFrame++;
            }

        }

        if(BUTTON_HELD(BUTTON_UP))
        {
            player.aniState = PLAYERBACK;
        }
        if(BUTTON_HELD(BUTTON_DOWN))
        {
            player.aniState = PLAYERFRONT;
        }
        if(BUTTON_HELD(BUTTON_LEFT))
        {
            player.aniState = PLAYERLEFT;
        }
        if(BUTTON_HELD(BUTTON_RIGHT))
        {
            player.aniState = PLAYERRIGHT;
        }
        
        if(player.aniState == PLAYERIDLE)
        {
            player.currFrame = 0;
        }
        else
        {
            player.aniCounter++;
        }

        //fireballs stuff

        for (int i=0; i<NUMOBJS; i++) {
            fireballs[i].prevAniState = fireballs[i].aniState;
            if (fireballs[i].rdel < 0 && fireballs[i].cdel > 0) {
                fireballs[i].aniState = UPRIGHT;
            } else if (fireballs[i].rdel > 0 && fireballs[i].cdel > 0) {
                fireballs[i].aniState = DOWNRIGHT;
            } else if (fireballs[i].rdel < 0 && fireballs[i].cdel < 0) {
                fireballs[i].aniState = UPLEFT;
            } else {
                fireballs[i].aniState = DOWNLEFT;
            }
        }
        
}
void updateOAM()
{
    shadowOAM[0].attr0 = (ROWMASK & player.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SIZE32;
    shadowOAM[0].attr2 = SPRITEOFFSET16(4*player.currFrame,4*player.prevAniState);

    shadowOAM[1].attr0 = (ROWMASK & key.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = (COLMASK & key.col) | ATTR1_SIZE32;
    shadowOAM[1].attr2 = SPRITEOFFSET16(key.currFrame,0);


    for (int i=0; i<NUMOBJS; i++) {
        shadowOAM[i+2].attr0 = (ROWMASK & fireballs[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[i+2].attr1 = (COLMASK & fireballs[i].col) | ATTR1_SIZE32;
        shadowOAM[i+2].attr2 = SPRITEOFFSET16(fireballs[i].currFrame*4, (fireballs[i].prevAniState + 4)*4);
    }

    
    
}


void pause()
{
	pauseSound();
	REG_DISPCTL = MODE4 | BG2_ENABLE;
    loadPalette(mainpalPal);
    drawBackgroundImage4(PauseBitmap);
    drawString3(130, 50, "Hit A to continue", 3);
    if(BUTTON_PRESSED(BUTTON_A))
	{
	
		unpauseSound();
		state = GAMESCREEN;
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3 | COLOR256;
        REG_BG1CNT = CBB(1) | SBB(24) | BG_SIZE0 | COLOR256;
        
        loadPalette(backgroundPal);
        DMANow(3, (unsigned int*)backgroundTiles, &CHARBLOCKBASE[0], backgroundTilesLen);
        DMANow(3, (unsigned int*)backgroundMap, &SCREENBLOCKBASE[27], backgroundMapLen);

        DMANow(3, (unsigned int*)bg2Tiles, &CHARBLOCKBASE[1], bg2TilesLen);
        DMANow(3, (unsigned int*)bg2Map, &SCREENBLOCKBASE[24], bg2MapLen);
        
        DMANow(3, characterTiles, &CHARBLOCKBASE[4], characterTilesLen);
        DMANow(3, characterPal, SPRITE_PALETTE, 256);
        
        hideSprites();
	}

}

void win()
{
    REG_DISPCTL = MODE4 | BG2_ENABLE;
    loadPalette(mainpalPal);
    drawBackgroundImage4(YouWinBitmap);
    drawString4(130, 50, "Hit Start to play again", 3);
    if (BUTTON_PRESSED(BUTTON_START)) 
    {
    	stopSound();
        state = STARTSCREEN;
        playSoundA(StartSong,STARTSONGLEN,STARTSONGFREQ);
		soundA.loops = 1;
    }

    
}

void lose()
{
    REG_DISPCTL = MODE4 | BG2_ENABLE;
    loadPalette(mainpalPal);
    drawBackgroundImage4(YouLoseBitmap);
    drawString4(130, 50, "Hit Start to play again", 3);
    if (BUTTON_PRESSED(BUTTON_START)) 
    {
        stopSound();
        state = STARTSCREEN;
        playSoundA(StartSong,STARTSONGLEN,STARTSONGFREQ);
		soundA.loops = 1;
    }

}
