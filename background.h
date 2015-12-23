
//{{BLOCK(background)

//======================================================================
//
//	background, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 46 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 2944 + 8192 = 11648
//
//	Time-stamp: 2015-11-24, 19:12:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 2944
extern const unsigned short backgroundTiles[1472];

#define backgroundMapLen 8192
extern const unsigned short backgroundMap[4096];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
