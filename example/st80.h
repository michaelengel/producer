// Collecting.h:
#ifndef VIDEOANIMATION_H
#define VIDEOANIMATION_H
#	include "DisplayObjects.h"

#	ifdef OBJC_COX
#	define CATEGORIES()
#	else
#	define CATEGORIES() (VideoAnimation, DisplayObjects, Collecting, Primitive)
#	endif

#endif


