#include "Producer.h"
= Node:Object CATEGORIES() { id successor; }
- successor { return successor; }
- successor:aLink { id me = successor; successor = aLink; return me; }

- lastElement { while(successor) self = successor; return self; }
// Reply the predecessor of the indicated link.
- predecessorOf:aLink {
	do { if (successor == aLink) return self; } while (self = successor);
	return nil;
}
// Reply the n'th link in this chain.
- at:(unsigned)anInt { register unsigned i = anInt; register id obj = self;
	while (i-- && obj) obj = obj->successor;
	return obj ? obj : [self error:"range error: %d", anInt];
}
// Append another instance to this chain.
- add:aLink { id me = self; while (successor) self = successor;
	successor = aLink; return me;
}
// Free this link and all successors
- freeContents { register id next;
	do { next = successor; [super free]; } while (self = next);
}
// remove
- remove:aLink { self =[self predecessorOf:aLink];
	 if (self == nil) return nil;
	 successor= [ aLink successor];
	 return aLink;
}
// insert
- insert:aLink 
	{ [ aLink successor:successor]; successor= aLink; return self; }

- gen 
	{ [self show]; [successor show]; return self; }
- free 
	{ [successor free]; return [super free]; }

// Reply the number of linked instances
#ifdef OBSOLETE
- (unsigned)size 
	{ register unsigned n = 1; while(self = successor) n++; return n; }
#endif
- (unsigned)size 
	{ unsigned i; for (i=1; self = successor; i++); return i; }

#ifndef COXLIB
- elementsPerform:(SEL)aSelector {
	do { [self perform:aSelector]; } while (self = successor);
	return self;
}
- elementsPerform:(SEL)aSelector with:arg1 {
	do { [self perform:aSelector with:arg1]; } while (self = successor);
	return self;
}
- elementsPerform:(SEL)aSelector with:arg1 with:arg2 {
	do { [self perform:aSelector with:arg1 with:arg2]; } while (self = successor);
	return self;
}
#else
- eachElementPerform:(SEL)aSelector {
	do { [self perform:aSelector]; } while (self = successor);
	return self;
}
- eachElementPerform:(SEL)aSelector with:arg1 {
	do { [self perform:aSelector with:arg1]; } while (self = successor);
	return self;
}
- eachElementPerform:(SEL)aSelector with:arg1 with:arg2 {
	do { [self perform:aSelector with:arg1 with:arg2]; } while (self = successor);
	return self;
}
#endif
=:
