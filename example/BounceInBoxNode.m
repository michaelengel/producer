// // MovingNode subclass: #BounceInBoxNode
// 	instanceVariableNames: ''
// 	classVariableNames: ''
// 	poolDictionaries: ''
// 	category: 'Graphics-Animation'!

#include "st80.h"
= BounceInBoxNode:MovingNode CATEGORIES(){
}
// 
// !BounceInBoxNode methodsFor: 'display'!
// displayOn: destForm at: aDisplayPoint clippingBox: clipRectangle rule: 
// 	ruleInteger mask: aForm
// 	| relLoc |
//  	super displayOn: destForm at: aDisplayPoint clippingBox: clipRectangle 
// 		rule: ruleInteger mask: aForm.
// 	relLoc _ location + clipRectangle origin.
// 	(velocity x < 0 and: [relLoc x < clipRectangle left])
// 		ifTrue: [velocity _ velocity*(-1@1)].
// 	(velocity x > 0 and: [(relLoc x+contents width) > clipRectangle right])
// 		ifTrue: [velocity _ velocity*(-1@1)].
// 	(velocity y < 0 and: [relLoc y < clipRectangle top])
// 		ifTrue: [velocity _ velocity*(1@-1)].
// 	(velocity y > 0 and: [(relLoc y+contents height) > clipRectangle bottom]
// )
// 		ifTrue: [velocity _ velocity*(1@-1)].
// ! !

- displayOn:destForm at:(PT)aDisplayPoint clippingBox:clipRectangle rule:(int)ruleInteger mask:aForm {
	PT relLoc;
	[super displayOn:destForm at:aDisplayPoint clipBy:clipRectangle rule:ruleInteger mask:aForm];
	relLoc = ptPlus(location, [clipRectangle origin]);
	if (ptX(velocity) < 0 && ptX(relLoc) < [clipRectangle left]) velocity = ptTimes(velocity, pt(-1,1))if (ptX(velocity) > 0 && ptX(relLoc) + [contents width] > [clipRectangle right]) velocity = ptTimes(velocity, pt(-1,1))if (ptY(velocity) < 0 && ptY(relLoc)


 < [clipRectangle top]) velocity = ptTimes(velocity, pt(1,-1))if (ptY(velocity) > 0 && ptY(relLoc) + [contents height] > [clipRectangle bottom]) velocity = ptTimes(velocity, pt(1,-1))return self;
}
// 
// \Rogue\Monster\
else
  echo "will not over write ./example/BounceInBoxNode.m"
fi
if `test ! -s ./log`
then
echo "writting ./log"
cat > ./log << '\Rogue\Monster\'
itroff -me mac.me doc.me
.C 0-1 ""
.H0 0-1 "Provisos"
.H0 0-1 "How it works"
.H0 0-2 "Status"
.H0 0-3 "What's in this distribution"
.H0 0-5 "Usage"
------ make doc.i
