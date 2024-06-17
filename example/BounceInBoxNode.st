MovingNode subclass: #BounceInBoxNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Graphics-Animation'!

!BounceInBoxNode methodsFor: 'display'!
displayOn: destForm at: aDisplayPoint clippingBox: clipRectangle rule: 
	ruleInteger mask: aForm
	| relLoc |
 	super displayOn: destForm at: aDisplayPoint clippingBox: clipRectangle 
		rule: ruleInteger mask: aForm.
	relLoc _ location + clipRectangle origin.
	(velocity x < 0 and: [relLoc x < clipRectangle left])
		ifTrue: [velocity _ velocity*(-1@1)].
	(velocity x > 0 and: [(relLoc x+contents width) > clipRectangle right])
		ifTrue: [velocity _ velocity*(-1@1)].
	(velocity y < 0 and: [relLoc y < clipRectangle top])
		ifTrue: [velocity _ velocity*(1@-1)].
	(velocity y > 0 and: [(relLoc y+contents height) > clipRectangle bottom]
)
		ifTrue: [velocity _ velocity*(1@-1)].
! !

