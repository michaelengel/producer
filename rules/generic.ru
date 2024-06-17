"ClassNames ==============================================================="
{ # ArrayedCollection (id) ArrayedCollection }
{ # Association (id) Assoc }
{ # Bag (id) Bag }
{ # Button (id) Button }
{ # ByteArray (id) ByteArray }
{ # Character (id) Character }
{ # Circle (id) Circle }
{ # Collection (id) Collection }
{ # Cursor (id) currentCursor }
{ # Dictionary (id) Dictionary }
{ # Display (id) currentDisplay }
{ # Drafting (id) Drafting }
{ # Form (id) Form }
{ # IdentityDictionary (id) IdentityDictionary }
{ # IdentitySet (id) IdentitySet }
{ # Interval (id) Interval }
{ # Line (id) Line }
{ # Link (id) Link }
{ # LinkedList (id) LinkedList }
{ # LookupKey (id) LookupKey }
{ # Magnitude (id) Magnitude }
{ # MappedCollection (id) MappedCollection }
{ # Object (id) Object }
{ # OrderedCollection (id) OrderedCollection }
{ # PositionableStream (id) PositionableStream }
{ # ReadStream (id) ReadStream }
{ # ReadWriteStream (id) ReadWriteStream }
{ # Rectangle (id) Rectangle }
{ # RunArray (id) RunArray }
{ # ScheduledControllers (id) ScheduledControllers }
{ # SequenceableCollection (id) SequenceableCollection }
{ # Set (id) Set }
{ # SortedCollection (id) SortedCollection }
{ # StandardSystemView (id) StdSysView }
{ # Stream (id) Stream }
{ # String (id) String }
{ # StringHolder (id) StringHolder }
{ # StringHolderView (id) StringHolderView }
{ # SwitchController (id) SwitchController }
{ # SwitchView (id) SwitchView }
{ # Symbol (id) Symbol }
{ # Text (id) Text }
{ # View (id) View }
{ # WriteStream (id) WriteStream }
{ # display (id) currentWindow }
{ # sensor (id) currentWindow }
{ # Sensor (id) currentWindow }

"Globals.rules ==============================================================="
{ # super (id) super }
{ # false (BOOL)NO }
{ # nil (id)nil }
{ # true (BOOL)YES }
{ # aPoint (PT) aPoint }
{ # len (int) len }
{ species # (id)'%0->isa'}
{ next:(int) # (id)[next:(int)%1] } 
{ next:(int) put:(id) # (id)[next:(int)%1 put:(id)%2] }
{ # (id)[copyFrom:(int)anInteger to:(int)readLimitInteger] }
{ # (id)[new:(int)anInteger] }
{ # (id)[at:(int)anInteger] }
{ # (id)[at:(int)anInteger put:anObject] }
{ # (int)[size] }

"Numbers.rules ==============================================================="
{ & (BLOCK) # (int)'%0 && %1' }
{ & (BOOL) # (int)'%0 && %1' }
{ eqv:(BOOL) # (int)'%0 == %1' }
{ not # (BLOCK)'!%0' }
{ xor:(BOOL) # (int)'%0 ^ %1' }
{ | (BOOL) # (int)'%0 | %1' }
{ and:(BLOCK) # (int)'%0 && %1' }
{ (int) < (int)	# (BOOL) '%0 < %1' }
{ (int) <= (int)	# (BOOL) '%0 <= %1' }
{ (int) = (int)	# (BOOL) '%0 == %1' }
{ (int) > (int)	# (BOOL) '%0 > %1' }
{ (int) >= (int)	# (BOOL) '%0 >= %1' }
{ (float) < (float)	# (BOOL) '%0 < %1' }
{ (float) <= (float)	# (BOOL) '%0 <= %1' }
{ (float) = (float)	# (BOOL) '%0 == %1' }
{ (float) > (float)	# (BOOL) '%0 > %1' }
{ (float) >= (float)	# (BOOL) '%0 >= %1' }
{ (int) < (float)	# (BOOL) '%0 < %1' }
{ (int) <= (float)	# (BOOL) '%0 <= %1' }
{ (int) = (float)	# (BOOL) '%0 == %1' }
{ (int) > (float)	# (BOOL) '%0 > %1' }
{ (int) >= (float)	# (BOOL) '%0 >= %1' }
{ (float) < (int)	# (BOOL) '%0 < %1' }
{ (float) <= (int)	# (BOOL) '%0 <= %1' }
{ (float) = (int)	# (BOOL) '%0 == %1' }
{ (float) > (int)	# (BOOL) '%0 > %1' }
{ (float) >= (int)	# (BOOL) '%0 >= %1' }
{ ifFalse:(BLOCK) # (int)'if (!%0) %1' }
{ ifFalse:(BLOCK) ifTrue:(BLOCK) # (int)'(!%0) ? %1 : %2' }
{ ifFalse:(BLOCK) ifTrue:(BLOCK) # (STMT)'if (!%0) %1 else %2' }
{ ifTrue:(BLOCK) # (STMT)'if (%0) %1' }
{ ifTrue:(BLOCK) ifFalse:(BLOCK) # (int)'(%0) ? %1 : %2' }
{ ifTrue:(BLOCK) ifFalse:(BLOCK) # (STMT)'if (%0) %1 else %2' }
{ or:(BLOCK) # (BOOL) '%0 | %1' }
{ (int)+ (int)	# (int) '%0 + %1' }
{ (int)- (int)	# (int) '%0 - %1' }
{ (int)* (int)	# (int) '(%0) * (%1)' }
{ (int)/ (int)	# (int) '(%0) / (%1)' }
{ (int)// (int)	# (int) '(%0) // (%1)' }
{ (int)abs	# (int) abs((int)%0) }
{ (int)negated	# (int) '-%0' }
{ (int)quo:(int)	# (int) quo(%0) }
{ (int)reciprocal	# (int) '1/(%0)' }
{ (int)rem:(int)	# (int) '%0 \% %1' }
{ (int)raisedTo:(float)	# (int) '(int)raiseToPower((float)(%0), (float)(%1))' }
{ (int)raisedToInteger:(int)	# (int) '(int)raiseToPowerInt((float)(%0), %1)' }
{ (int)raisedToInteger:(float)	# (int) '(int)raiseToPowerInt((float)(%0), %1)' }
{ (int)sin	# (int) '(int)sin((float)(%0))' }
{ (int)sqrt	# (int) '(int)sqrt((float)(%0))' }
{ (int)tan	# (int) '(int)tan((float)(%0))' }
{ (int)\\ (int)	# (int) '%0 \\ %1' }
{ (int)raisedTo:(int)	# (int) 'raiseToPower(%0, %1)' }
{ (int)raisedToInteger:(int)	# (int) 'raiseToPointInt(%0, %1)' }
{ (int)squared	# (int) '%0*%0' }
{ (int)even	# (int) '(%0 & 1) == 0' }
{ (int)negative	# (int) '-%0' }
{ (int)odd	# (int) '(%0 & 1) != 0' }
{ (int)positive	# (int) '%0 >= 0' }
{ (int)sign	# (int) '%0 < 0' }
{ (int)strictlyPositive	# (int) '%0 > 0' }
{ (int)rounded	# (int) '%0' }
{ (int)roundTo:(int)	# (int) roundTo((int)%0, (int)%1) }
{ (int)truncated	# (int) truncated((int)%0) }
{ (int)truncateTo:(int)	# (int) truncateTo(%0, %1) }
{ (int)coerce:(int)	# (int) coerce(%0, %1) }
{ (int)generality	# (int) generality(%0) }
{ (int)retry:(BLOCK) coercing:(int)	# (int) retryCoercing(%0, %1, %2) }
{ (int)@ (int)	# (PT) pt(%0, %1) }
{ (int)asInteger	# (int) '(int)%0' }
{ (int)asFloat	# (float) '(float)%0' }
{ (float)asFloat	# (float) '%0' }
{ (int)asPoint	# (PT) pt(%0, %0) }
{ (float)asPoint	# (PT) pt(%0, %0) }
{ (int)to:(int)	# (int) to(%0, %1) }
{ (int)to:(int) by:(int)	# (int) toBy(%0, %1, %2) }
{ (int)to:(int) by:(int) do:(BLOCK)	# (STMT) 'for (i = %0; i < %1; i+= %2) %3' }
{ (int)to:(int) do:(BLOCK)	# (STMT) 'for(i = %0; i < %1; i++) %2' }
{ (int)timesRepeat:(BLOCK) # (STMT) 'for(i = 0; i < %0; i++) %1' }
{ (float)timesRepeat:(BLOCK) # (STMT) 'for(i = 0; i < %0; i++) %1' }
{ do:(BLOCK)	# (id) 'for(s = [%0 eachElement]; m = [s next];) %1; [s free];' }
{ whileTrue:(BLOCK)	# 'while(%0) %1' }
{ whileFalse:(BLOCK)	# 'while(!%0) %1' }
{ (int)storeOn:(IOD)	# (int) storeOn(%0, %1) }
{ (int)readFrom:(IOD)	# (int) readFrom(%0, %1) }
{ (float)+ (float)	# (float) '%0 + %1' }
{ (float)- (float)	# (float) '%0 - %1' }
{ (float)* (float)	# (float) '(%0) * (%1)' }
{ (float)/ (float)	# (float) '(%0) / (%1)' }
{ (float)// (float)	# (float) '(%0) // (%1)' }
{ (float)abs	# (float) abs((float)%0) }
{ (float)negated	# (float) '-(%0)' }
{ (float)quo:(float)	# (float) 'quo(%0)' }
{ (float)reciprocal	# (float) '1./(%0)' }
{ (float)rem:(float)	# (float) '(%0) \% (%1)' }
{ (float)\\ (float)	# (float) '(%0) \\ (%1)' }
{ (float)arcCos	# (float) arcCos(%0) }
{ (float)arcSin	# (float) arcSin(%0) }
{ (float)arcTan	# (float) arcTan(%0) }
{ (float)cos	# (float) cos(%0) }
{ (int)cos	# (float) 'cos((float)(%0))' }
{ (float)exp	# (fint) exp(%0) }
{ (int)exp	# (float) 'exp((float)(%0))' }
{ (float)floorLog:(float)	# (float) floorLog(%0, %1) }
{ (float)ln	# (float) ln(%0) }
{ (float)log:(float)	# (float) log(%0) }
{ (float)raisedTo:(float)	# (float) raiseToPower(%0, %1) }
{ (float)raisedToInteger:(float)	# (float) raiseToPointInt(%0, %1) 
}
{ (float)sin	# (float) sin(%0) }
{ (float)sqrt	# (float) sqrt(%0) }
{ (float)squared	# (float) '%0*%0' }
{ (float)tan	# (float) tan(%0) }
{ (float)even	# (float) '(%0 & 1) == 0' }
{ (float)negative	# (float) '-%0' }
{ (float)odd	# (float) '(%0 & 1) != 0' }
{ (float)positive	# (float) '%0 >= 0' }
{ (float)sign	# (float) '%0 < 0' }
{ (float)strictlyPositive	# (float) '%x > 0' }
{ (float)ceiling	# (float) ceil(%0) }
{ (float)floor	# (float) floor(%0) }
{ (float)rounded	# (int) '(int)(%0+.5)' }
{ (float)roundTo:(float)	# (float) roundTo(%0, %1) }
{ (float)truncated	# (int) '((int)%0)' }
{ (float)truncateTo:(float)	# (float) truncateTo(%0, %1) }
{ (float)coerce:(float)	# (float) coerce(%0, %1) }
{ (float)generality	# (int) generality(%0) }
{ (float)retry:(BLOCK) coercing:(float)	# (float) retryCoercing(%0, %1, %2) }
{ (float)@ (float)	# (PT) 'pt((int)%0, (int)%1)' }
{ (float)asInteger	# (int) '(int)(%0)' }
{ (float)asPoint	# (float) 'pt((int)(%0), (int)(%0))' }
{ (float)degreesToRadians	# (float) degreesToRadians(%0) }
{ (int)degreesToRadians	# (float) 'degreesToRadians((float)(%0))' }
{ (float)radiansToDegrees	# (float) radiansToDegrees(%0) }
{ (int)radiansToDegrees	# (float) 'radiansToDegrees((float)(%0))' }
{ (float)to:(float)	# (float) to(%0, %1) }
{ (float)to:(float) by:(float)	# (float) toBy(%0, %1, %2) }
{ (float)to:(float) by:(float) do:(BLOCK)	# (float) 'for (x = %0; x < %1; x += %2) %3' 
}
{ (float)to:(float) do:(BLOCK)	# (float) 'for(x = %0; x < %1; x++) %2' 
}
{ (float)storeOn:(IOD)	# (float) storeOn(%0, %1) }
{ (float)readFrom:(IOD)	# (float) readFrom(%0, %1) }

"Misc.rules=================================================================="
{ (id)= (id) # (BOOL) '[%0 isEqual:%1]' } "Which is == and which isEqual?"
{ (int)= (int) # (BOOL) '%0 == %1' }
{ (int)= (float) # (BOOL) '%0 == %1' }
{ (float)= (int) # (BOOL) '%0 == %1' }
{ (BOOL)= (BOOL) # (BOOL) '%0 == %1' }
{ (id)== (id) # (BOOL) '%0 == %1' } "Which is == and which isEqual?"
{ (int)== (int) # (BOOL) '%0 == %1' }
{ (int)== (float) # (BOOL) '%0 == %1' }
{ (float)== (float) # (BOOL) '%0 == %1' }
{ (BOOL)== (BOOL) # (BOOL) '%0 == %1' }
{ associationsDo:(BLOCK) # 'for(seq = [[%0 associations] eachElement]; obj = [seq next]; ) %1' }

"Point.rules=================================================================="
{ (PT)x 		# (int)	'ptX(%0)' }
{ (PT)y 		# (int)	'ptY(%0)' }
{ (PT)x: (int)	# (PT) 'ptX(%0)=%1' }
{ (PT)y: (int)	# (PT) 'ptY(%0)=%1' }
{ (PT)< (int)	# (BOOL) 'ptIsLess(%0, %1)' }
{ (PT)<= (int)	# (BOOL) 'ptIsLessOrEqual(%0, %1)' }
{ (PT)= (int)	# (BOOL) 'ptIsEqual(%0, %1)' }
{ (PT)> (int)	# (BOOL) 'ptIsGreater(%0, %1)' }
{ (PT)>= (int)	# (BOOL) 'ptIsGreaterOrEqual(%0, %1)' }
{ (PT) hash 	# (int) '%0' }
{ (PT) hashMappedBy:(int)	# (PT) '%0' }
{ (int) max:(int)	# (int) 'min(%0, %1)' }
{ (int) min:(int)	# (int) 'max(%0, %1)' }
{ (float) max:(float)	# (float) 'min(%0, %1)' }
{ (float) min:(float)	# (float) 'max(%0, %1)' }
{ (PT) max:(PT)	# (PT) 'ptMax(%0, %1)' }
{ (PT) min:(PT)	# (PT) 'ptMin(%0, %1)' }
{ (PT) * (PT)	# (PT) 'ptTimes(%0, %1)' }
{ (PT) + (PT)	# (PT) 'ptPlus(%0, %1)' }
{ (PT) - (PT)	# (PT) 'ptMinus(%0, %1)' }
{ (PT) /(PT)	# (PT) 'ptSlash(%0, %1)' }
{ (PT) // (PT)	# (PT) 'ptSlashSlash(%0, %1)' }
{ (PT) * (int)	# (PT) 'ptTimesInt(%0, %1)' }
{ (PT) + (int)	# (PT) 'ptPlusInt(%0, %1)' }
{ (PT) - (int)	# (PT) 'ptMinusInt(%0, %1)' }
{ (PT) / (int)	# (PT) 'ptSlashInt(%0, %1)' }
{ (PT) // (int)	# (PT) 'ptSlashSlashInt(%0, %1)' }
{ (PT) abs 	# (PT) 'ptAbs(%0)' }
{ (PT) rounded	# (PT) '%0' }
{ (PT) truncateTo:(PT)	# (PT) 'ptTrunc(%0, %1)' }
{ (PT) r	# (PT) 'r(%0)' }
{ (PT) theta	# (int) 'ptTheta(%0)' }
{ (PT) dist:(PT)	# (int) 'ptDist(%0, %1)' }
{ (PT) dotProduct:(PT)	# (PT) 'ptDotProduct(%0, %1)' }
{ (PT) grid:(PT)	# (PT) 'ptGrid(%0, %1)' }
{ (PT) normal 	# (PT) 'ptNormal(%0)' }
{ (PT) pointNearestLine:(PT) to:(PT)	# (PT) 'ptNearestLine(%0, %1, %2)' }
{ (PT) transpose	# (PT) 'ptTranspose(%0, %1)' }
{ (PT) truncatedGrid:(PT)	# (PT) 'ptTruncatedGrid(%0, %1)' }
{ (PT) unitVector	# (PT) 'ptUnitVector(%0)' }
{ (PT) asPoint	# (PT) '%0' }
{ (PT) corner:(PT)	# (id) '[Rectangle origin:%0 corner:%1]' }
{ (PT) extent:(PT)	# (id) '[Rectangle origin:%0 extent:%1]' }
{ (id) extent:(PT)	# (id) '[%0 extent:%1]' }
{ (PT) coerce:(int)	# (PT) 'ptCoerce(%0, %1)' }
{ (PT) generality	# (int) 'ptGenerality(%0, %1)' }
{ (PT) scaleBy:(PT)	# (PT) 'ptScaleBy(%0, %1)' }
{ (PT) translateBy:(PT)	# (PT) 'ptPlus(%0, %1)' }
{ (PT) deepCopy	# (PT) '%0' }
{ (PT) shallowCopy	# (PT) '%0' }
{ (PT) printOn:(PT)	# (PT) 'ptPrn(%0)' }
{ (PT) storeOn:(PT)	# (PT) 'ptPrn(%0)' }

"DisplayObjects.rules========================================================"
{ # (float)	[direction] }
{ # (BOOL)	[contains:aRectangle] }
{ # (BOOL)	[containsPoint:(PT)aPoint] }
{ # (BOOL)	[cursorEnterView] }
{ # (BOOL)	[cursorExitView] }
{ # (BOOL)	[cursorMove] }
{ # (BOOL)	[cursorStill] }
{ # (BOOL)	[doEvent] }
{ # (BOOL)	[eventStillOcurring] }
{ # (BOOL)	[intersects:aRectangle] }
{ # (BOOL)	[isEqual:aRectangle] }
{ # (BOOL)	[isLocked] }
{ # (BOOL)	[isSelectionSelected] }
{ # (BOOL)	[isTopView] }
{ # (BOOL)	[isUnlocked] }
{ # (BOOL)	[keyboardEvent] }
{ # (BOOL)	[leftButtonDown] }
{ # (BOOL)	[leftButtonUp] }
{ # (BOOL)	[middleButtonDown] }
{ # (BOOL)	[middleButtonUp] }
{ # (BOOL)	[noscale] }
{ # (BOOL)	[rightButtonDown] }
{ # (BOOL)	[rightButtonUp] }
{ # (BOOL)	[timeoutEvent] }
{ # (BOOL)	[windowChangedEvent] }
{ # (BOOL)	[anyButtonChanged] }
{ # (BOOL)	[anyButtonDown] }
{ # (BOOL)	[contains:aRectangle] }
{ # (BOOL)	[containsPoint:(PT)aPoint] }
{ # (BOOL)	[intersects:r] }
{ # (BOOL)	[isContainedBy:aRectangle] }
{ # (BOOL)	[isEqual:aRectangle] }
{ # (BOOL)	[leftButtonChanged] }
{ # (BOOL)	[leftButtonDown] }
{ # (BOOL)	[leftButtonUp] }
{ # (BOOL)	[middleButtonChanged] }
{ # (BOOL)	[middleButtonDown] }
{ # (BOOL)	[middleButtonUp] }
{ # (BOOL)	[noButtonChanged] }
{ # (BOOL)	[noButtonDown] }
{ # (BOOL)	[rightButtonChanged] }
{ # (BOOL)	[rightButtonDown] }
{ # (BOOL)	[rightButtonUp] }
{ # (BYTE)	[readEvent] }
{ # (id)	[asForm] }
{ # (id)	[destinationForm] }
{ # (id)	[form] }
{ # (id)	[mask] }
{ # (int)	[outputMedium] }
{ # (PT)	[amountToTranslateWithin:aRectangle] }
{ # (PT)	[applyInverseTo:(PT)aPoint] }
{ # (PT)	[applyTo:(PT)aPoint] }
{ # (PT)	[bottomCenter] }
{ # (PT)	[bottomLeft] }
{ # (PT)	[bottomRight] }
{ # (PT)	[center] }
{ # (PT)	[centerLeft] }
{ # (PT)	[centerRight] }
{ # (PT)	[corner] }
{ # (PT)	[extent] }
{ # (PT)	[origin] }
{ # (PT)	[scale] }
{ # (PT)	[topCenter] }
{ # (PT)	[topLeft] }
{ # (PT)	[topRight] }
{ # (PT)	[translation] }
{ # (PT)	[amountToTranslateWithin:aRectangle] }
{ # (PT)	[bottomCenter] }
{ # (PT)	[bottomLeft] }
{ # (PT)	[bottomRight] }
{ # (PT)	[center] }
{ # (PT)	[centerLeft] }
{ # (PT)	[centerRight] }
{ # (PT)	[corner] }
{ # (PT)	[extent] }
{ # (PT)	[location] }
{ # (PT)	[origin] }
{ # (PT)	[topCenter] }
{ # (PT)	[topLeft] }
{ # (PT)	[topRight] }
{ # (PT)	[waitButton] }
{ # (id)	[boundingBox] }
{ # (id)	[clippingRectangle] }
{ # (id)	[compositionRectangle] }
{ # (id)	[computeBoundingBox] }
{ # (id)	[frame] }
{ # (id)	[visibleRectangle] }
{ # (int)	[rule] }
{ # (STR)	[string] }
{ # (STYLE)	[alignment] }
{ # (id)	[openAt:p] }
{ # (id)	[takeControl:p] }
{ # (int)	[area] }
{ # (int)	[bottom] }
{ # (int)	[fileDescriptor] }
{ # (int)	[hash] }
{ # (int)	[hashMappedBy:map] }
{ # (int)	[height] }
{ # (int)	[left] }
{ # (int)	[lineGrid] }
{ # (int)	[numberOfLines] }
{ # (int)	[paddingWidth] }
{ # (int)	[right] }
{ # (int)	[top] }
{ # (int)	[valueAt:(PT)aPoint] }
{ # (int)	[width] }
{ # (int)	[baseline] }
{ # (int)	[bottom] }
{ # (int)	[composeAll] }
{ # (int)	[compositionRectangleDelta] }
{ # (int)	[count] }
{ # (int)	[dyForPoint:(PT)pt] }
{ # (int)	[fileDescriptor] }
{ # (int)	[firstIndent] }
{ # (int)	[firstIndex] }
{ # (int)	[hash] }
{ # (int)	[hashMappedBy:map] }
{ # (int)	[height] }
{ # (int)	[indexOf:aSomething] }
{ # (int)	[lastIndex] }
{ # (int)	[left] }
{ # (int)	[leftMarginForCompositionForLine:(int)lineIndex] }
{ # (int)	[leftMarginForDisplayForLine:(int)lineIndex] }
{ # (int)	[leftMarginTabAt:(int)anInt] }
{ # (int)	[lineGrid] }
{ # (int)	[lineIndexOfCharacterIndex:(int)characterIndex] }
{ # (int)	[lineIndexOfTop:(int)top] }
{ # (int)	[lines:anArray] }
{ # (int)	[marginTabsLevel] }
{ # (int)	[numberOfLines] }
{ # (int)	[restIndent] }
{ # (int)	[right] }
{ # (int)	[rightIndent] }
{ # (int)	[rightMarginForComposition] }
{ # (int)	[rightMarginForDisplay] }
{ # (int)	[rightMarginTabAt:(int)huh] }
{ # (int)	[rightX] }
{ # (int)	[senseDelay:(int)msec] }
{ # (int)	[senseDelay:time] }
{ # (int)	[top] }
{ # (int)	[topAtLineIndex:(int)lineIndex] }
{ # (int)	[valueAt:(PT)aPoint] }
{ # (int)	[width] }
{ # (BITS)	[bits] }
{ # (id)	[align:(PT)aPoint1 with:(PT)aPoint2] }
{ # (id)	[append:aLink] }
{ # (id)	[area:aRectangle] }
{ # (id)	[areasDiffering:aRectangle] }
{ # (id)	[areasOutside:aRectangle] }
{ # (id)	[asParagraph] }
{ # (id)	[asString] }
{ # (id)	[asText] }
{ # (id)	[backgroundAt:(PT)aPoint] }
{ # (id)	[beCursor] }
{ # (id)	[black] }
{ # (id)	[black:aRectangle] }
{ # (id)	[border:aRectangle width:(int)borderWidth] }
{ # (id)	[border:aRectangle width:(int)borderWidth mask:aHalfTone] }
{ # (id)	[border:aRectangle widthRectangle:insets mask:aHalfTone] }
{ # (id)	[border:aRectangle widthRectangle:insets mask:aHalfTone clipBy:aClipRectList] }
{ # (id)	[borderWidth:(int)aWidth] }
{ # (id)	[borderWidth:(int)aWidth mask:aMask] }
{ # (id)	[bottom:(int)anInteger] }
{ # (id)	[boundingBox] }
{ # (id)	[centerX:(int)anInteger] }
{ # (id)	[centerY:(int)anInteger] }
{ # (id)	[centered] }
{ # (id)	[characterBlockAtPoint:(PT)aPoint] }
{ # (id)	[characterBlockForIndex:(int)targetIndex] }
{ # (id)	[clearIndents] }
{ # (id)	[clearVisibleRectangle] }
{ # (id)	[clipHeight:(int)anInteger] }
{ # (id)	[clipList] }
{ # (id)	[clipList:aClipRectList] }
{ # (id)	[clipWidth:(int)anInteger] }
{ # (id)	[clipX:(int)anInteger] }
{ # (id)	[clipY:(int)anInteger] }
{ # (id)	[clippingRectangle:aRectangle] }
{ # (id)	[color:ignored] }
{ # (id)	[combinationRule:(int)anInteger] }
{ # (id)	[composeForm] }
{ # (id)	[compositionRectangle:compRectangle] }
{ # (id)	[compositionRectangle:compositionRect text:aText style:aTextStyle offset:(PT)aPoint outputMedium:(int)aSymbol fitWidth:(BOOL)aBoolean] }
{ # (id)	[computeBoundingBox] }
{ # (id)	[convexShapeFill:aMask] }
{ # (id)	[copyBits] }
{ # (id)	[copyBitsAgain] }
{ # (id)	[copyFrom:(PT)sourcePoint to:(PT)destPoint extent:(PT)extentPoint form:sourceForm clipBy:aClipRectList rule:(int)rule mask:halftoneForm] }
{ # (id)	[copyFromArea:destRectangle toPoint:(PT)destPoint form:sourceForm clipBy:aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyFromArea:sourceRect toPoint:(PT)destOrigin form:sourceForm clipBy:aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyFromArea:sourceRect toPoint:(PT)destOrigin form:sourceForm clipBy:aClipRectList rule:(int)rule mask:aForm] }
{ # (id)	[copyFromArea:sourceRect toPoint:(PT)destOrigin form:sourceForm clipBy:aClipRectList rule:(int)rule mask:halftoneForm] }
{ # (id)	[copyLinesFrom:(int)firstIndex to:(int)lastIndex] }
{ # (id)	[copyStr:(STR)sourceString font:aFont at:(PT)destOrigin clipBy:aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyToArea:destRectangle fromPoint:(PT)destPoint form:sourceForm rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyToArea:destRectangle fromPoint:(PT)sourcePt form:sourceForm rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyToArea:destRectangle fromPoint:(PT)sourcePt form:sourceForm rule:(int)rule mask:halftoneForm] }
{ # (id)	[corner:(PT)c1 corner:(PT)c2] }
{ # (id)	[corner:(PT)cornerPoint] }
{ # (id)	[cursorLink:(BOOL)yesno] }
{ # (id)	[darkGray] }
{ # (id)	[darkGray:aRectangle] }
{ # (id)	[deepCopy] }
{ # (id)	[defaultNib:(int)widthInteger] }
{ # (id)	[deltaMarginTabsLevel:(int)anInteger] }
{ # (id)	[destForm:aForm] }
{ # (id)	[destForm:df sourceForm:sf halftoneForm:hf combinationRule:(int)rule destOrigin:(PT)destOriginPoint sourceOrigin:(PT)sourceOriginPoint extent:(PT)anExtent clipList:aClipRectList] }
{ # (id)	[destOrigin:(PT)aPoint] }
{ # (id)	[destRect:aRectangle] }
{ # (id)	[destX:(int)anInteger] }
{ # (id)	[destY:(int)anInteger] }
{ # (id)	[destinationForm:aFormOrRectangle] }
{ # (id)	[display] }
{ # (id)	[displayAt:(PT)aDisplayPoint] }
{ # (id)	[displayAt:(PT)aPoint] }
{ # (id)	[displayCaretAt:(PT)aPoint] }
{ # (id)	[displayCaretAt:(PT)aPoint andClip:clipBox] }
{ # (id)	[displayCaretForBlock:aCharacterBlock] }
{ # (id)	[displayLinesFrom:(int)firstIndex to:(int)lastIndex] }
{ # (id)	[displayOn:aDisplay transformation:displayTransformation clipBy:aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[displayOn:aDisplayMedium] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:aClipRectList] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:aClipRectList rule:(int)combinationRule mask:maskForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:aClipRectList rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:aClipRectList rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint rule:(int)ruleInteger] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:aClipRectList] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:aClipRectList fixedPoint:(PT)aPoint] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:aClipRectList rule:(int)ruleInteger mask:aForm] }
{ # (id)	[dotOfSize:(int)diameter] }
{ # (id)	[down] }
{ # (id)	[dragon:(int)order] }
{ # (id)	[drawFrom:(PT)startPoint to:(PT)stopPoint] }
{ # (id)	[drawLine:sourceForm from:(PT)beginPoint to:(PT)endPoint clipBy:aClipRectList rule:(int)anInteger mask:aForm] }
{ # (id)	[drawLine:sourceForm from:(PT)beginPoint to:(PT)endPoint clipBy:aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[drawLineAround:aRectangle clipBy:cr rule:(int)combinationRule] }
{ # (id)	[drawLineFrom:(PT)bp to:(PT)ep clipBy:aClipRectList rule:(int)combinationRule] }
{ # (id)	[drawLineFrom:(PT)bp to:(PT)ep clipBy:aClipRectList rule:(int)rule] }
{ # (id)	[drawLoopDeltaX:(int)xDelta deltaY:(int)yDelta] }
{ # (id)	[example] }
{ # (id)	[expandByInt:(int)delta] }
{ # (id)	[expandByPoint:(PT)delta] }
{ # (id)	[expandByRectangle:aRectangle] }
{ # (id)	[extent:(PT)aPoint] }
{ # (id)	[extent:(PT)anExtent figureBits:(BITS)figureBits shapeBits:(BITS)shapeBits] }
{ # (id)	[extent:(PT)extentPoint] }
{ # (id)	[extent:(PT)extentPoint bits:(BITS)theBits] }
{ # (id)	[figure] }
{ # (id)	[figure:figureForm shape:shapeForm] }
{ # (id)	[filberts:(int)n side:(int)s] }
{ # (id)	[fill:aRectangle] }
{ # (id)	[fill:aRectangle mask:aForm] }
{ # (id)	[fill:aRectangle rule:(int)anInteger mask:aForm] }
{ # (id)	[fill:aRectangle rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[fill:aRectangle rule:(int)combinationRule mask:halftoneForm clipBy:aClipRectList] }
{ # (id)	[fillIn:aBlock] }
{ # (id)	[first] }
{ # (id)	[firstIndent:(int)anInteger] }
{ # (id)	[fit] }
{ # (id)	[flash] }
{ # (id)	[flash:aRectangle] }
{ # (id)	[follow:locationBlock while:durationBlock] }
{ # (id)	[form] }
{ # (id)	[frame:aClipRectList] }
{ # (id)	[free] }
{ # (id)	[freeAll] }
{ # (id)	[fromDisplay:aRectangle] }
{ # (id)	[fromUser] }
{ # (id)	[fromUser:(PT)aPoint] }
{ # (id)	[fromUser:(PT)gridPoint] }
{ # (id)	[fromUser:(PT)originPoint] }
{ # (id)	[fromUserAspectRatio:(PT)aspectPoint] }
{ # (id)	[go:distance] }
{ (id)go:(int) # (id)	'[%0 go:(float)(distance)]' }
{ (id)go:(float) # (id)	'[%0 go:distance]' }
{ # (id)	[goto:(PT)aPoint] }
{ # (id)	[gray] }
{ # (id)	[gray:aRectangle] }
{ # (id)	[gridWithLead:(int)leadInteger] }
{ # (id)	[height:(int)anInteger] }
{ # (id)	[height:(int)heightInteger] }
{ # (id)	[hilbert:n side:s] }
{ # (id)	[hilberts:(int)n] }
{ # (id)	[home] }
{ # (id)	[initialize] }
{ # (id)	[insert:aLink] }
{ # (id)	[insetByInt:(int)delta] }
{ # (id)	[insetByPoint:(PT)delta] }
{ # (id)	[insetByRectangle:aRectangle] }
{ # (id)	[insetDisplayBox] }
{ # (id)	[insetOriginBy:(PT)originDeltaPoint cornerBy:(PT)cornerDeltaPoint] }
{ # (id)	[intersect:r] }
{ # (id)	[justified] }
{ # (id)	[last] }
{ # (id)	[left:(int)aLeft top:(int)aTop width:(int)aWidth height:(int)aHeight] }
{ # (id)	[left:(int)anInteger] }
{ # (id)	[left:(int)left top:(int)top right:(int)right bottom:(int)bottom] }
{ # (id)	[left:(int)leftNumber right:(int)rightNumber top:(int)topNumber bottom:(int)bottomNumber] }
{ # (id)	[leftFlush] }
{ # (id)	[lightGray] }
{ # (id)	[lightGray:aRectangle] }
{ # (id)	[lineAt:(int)indexInteger put:aTextLineInterval] }
{ # (id)	[lineAt:(int)lineIndex] }
{ # (id)	[lines] }
{ # (id)	[linkAt:(int)anInt] }
{ # (id)	[lock] }
{ # (id)	[lock:aRectangle] }
{ # (id)	[magnifyBy:(PT)scale] }
{ # (id)	[mandala:(int)npoints diameter:(int)d] }
{ # (id)	[marginTabsLevel:(int)anInteger] }
{ # (id)	[mask:aForm] }
{ # (id)	[mask:maskForm] }
{ # (id)	[merge:r] }
{ # (id)	[mergeWith:r] }
{ # (id)	[mouseSelect:previousStartBlock to:previousStopBlock] }
{ # (id)	[moveBy:(PT)aPoint] }
{ # (id)	[moveBy:(PT)aPoint with:aClipRectList] }
{ # (id)	[moveBy:(int)aPoint] }
{ # (id)	[moveTo:(PT)aPoint] }
{ # (id)	[moveTo:(PT)newLoc restoring:background] }
{ # (id)	[new] }
{ # (id)	[north] }
{ # (id)	[offset:(PT)aPoint] }
{ # (id)	[origin:(PT)aPoint] }
{ # (id)	[origin:(PT)op corner:(PT)cp] }
{ # (id)	[origin:(PT)originPoint] }
{ # (id)	[origin:(PT)originPoint corner:(PT)cornerPoint] }
{ # (id)	[origin:(PT)originPoint extent:(PT)extentPoint] }
{ # (id)	[origin:(PT)originPoint extent:(PT)extentPoint bits:(BITS)theBits] }
{ # (id)	[origin:(PT)originPoint extent:(PT)extentPoint window:(int)aFd] }
{ # (id)	[originFromUser:(PT)extentPoint] }
{ # (id)	[originFromUser:(PT)extentPoint grid:(int)scaleFactor] }
{ # (id)	[outline] }
{ # (id)	[outputMedium:(int)aSymbol] }
{ # (id)	[paintBits] }
{ # (id)	[place:(PT)aPoint] }
{ # (id)	[predecessorOf:aLink] }
{ # (id)	[print] }
{ # (id)	[putEventBack] }
{ # (id)	[receiver:anObject selector:(SEL)aSelector] }
{ # (id)	[recomposeIn:compositionRect clipBy:clippingRect] }
{ # (id)	[relativeRectangle] }
{ # (id)	[remove:aLink] }
{ # (id)	[removeFirstChars:numberOfChars] }
{ # (id)	[replaceFrom:(int)start to:(int)stop with:aText displaying:(BOOL)displayBoolean] }
{ # (id)	[repositionAt:(PT)aPoint clipBy:clippingBox] }
{ # (id)	[resetLocks] }
{ # (id)	[restIndent:(int)anInteger] }
{ # (id)	[reverse] }
{ # (id)	[reverse:aRectangle] }
{ # (id)	[reverse:aRectangle mask:aMask] }
{ # (id)	[reverseFrom:characterBlock1 to:characterBlock2] }
{ # (id)	[reverseFrom:characterBlock1 to:characterBlock2 andClip:clipBox] }
{ # (id)	[reverseRectangle:aRectangle] }
{ # (id)	[right:(int)anInteger] }
{ # (id)	[rightFlush] }
{ # (id)	[rightIndent:(int)anInteger] }
{ # (id)	[rounded] }
{ # (id)	[rule:(int)ruleInteger] }
{ # (id)	[scaleBy:(int)scale] }
{ # (id)	[scrollBy:(int)height grid:(int)grid] }
{ # (id)	[scrollBy:(int)heightToMove] }
{ # (id)	[selectWord:stringIndex] }
{ # (id)	[senseAllButtons:(BOOL)onoff] }
{ # (id)	[senseLeftButton:(BOOL)onoff] }
{ # (id)	[senseMiddleButton:(BOOL)onoff] }
{ # (id)	[senseMove:(BOOL)onoff] }
{ # (id)	[senseMoveWhileButtonDown:(BOOL)onoff] }
{ # (id)	[senseRightButton:(BOOL)onoff] }
{ # (id)	[senseStill:(BOOL)onoff] }
{ # (id)	[senseWindowEnter:(BOOL)onoff] }
{ # (id)	[senseWindowExit:(BOOL)onoff] }
{ # (id)	[setFigure:figureForm shape:shapeForm] }
{ # (id)	[setInputMasks] }
{ # (id)	[setMask:(int)anEventMask to:(BOOL)onoff] }
{ # (id)	[shape] }
{ # (id)	[shape:aSolidForm] }
{ # (id)	[sourceForm:aForm] }
{ # (id)	[sourceOrigin:(PT)aPoint] }
{ # (id)	[sourceRect:aRectangle] }
{ # (id)	[sourceX:(int)anInteger] }
{ # (id)	[sourceY:(int)anInteger] }
{ # (id)	[spiral:(int)n angle:(float)a] }
{ # (id)	[str:(STR)sourceString font:aFont at:(PT)destOrigin rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[successor] }
{ # (id)	[successor:aLink] }
{ # (id)	[text] }
{ # (id)	[text:aText] }
{ # (id)	[text:aText textStyle:aTextStyle] }
{ # (id)	[text:aText textStyle:aTextStyle offset:(PT)aPoint] }
{ # (id)	[textAt:(int)lineIndex] }
{ # (id)	[textStyle] }
{ # (id)	[textStyle:aTextStyle] }
{ # (id)	[toReverse:aRectangle] }
{ # (id)	[toggleAlignment] }
{ # (id)	[top:(int)anInteger] }
{ # (id)	[trackFunction:(IMP)aTrackingFunction] }
{ # (id)	[translateBy:(PT)aPoint] }
{ # (id)	[translateByInt:(int)factor] }
{ # (id)	[trimLinesTo:(int)lastLineInteger] }
{ (id)turn:(int) # (id)	'[%0 turn:((float)%1)]' }
{ (id)turn:(float) # (id)	'[%0 turn:%1]' }
{ # (id)	[unlock] }
{ # (id)	[up] }
{ # (id)	[updateCompositionHeight] }
{ # (id)	[updateOrigin:(PT)anOrigin extent:(PT)anExtent] }
{ # (id)	[value] }
{ # (id)	[valueAt:(PT)aPoint put:(int)bitValue] }
{ # (id)	[valueAt:(PT)aPoint put:(int)value] }
{ # (id)	[veryLightGray] }
{ # (id)	[veryLightGray:aRectangle] }
{ # (id)	[waitButton] }
{ # (id)	[waitNoButton] }
{ # (id)	[white] }
{ # (id)	[white:aRectangle] }
{ # (id)	[width:(int)anInteger] }
{ # (id)	[width:(int)widthInteger] }
{ # (id)	[windowChanged] }
{ # (id)	[with:aForm] }
{ # (id)	[withText:aText] }
{ # (id)	[withText:aText style:aTextStyle] }
{ # (id)	[withText:aText style:aTextStyle compositionRectangle:compRect clippingRectangle:aClipRectList] }



{ # (BOOL)	[contains:(id)aRectangle] }
{ # (BOOL)	[intersects:(id)aRectangle] }
{ # (BOOL)	[contains:(id)aRectangle] }
{ # (BOOL)	[intersects:(id)r] }
{ # (BOOL)	[isContainedBy:(id)aRectangle] }
{ # (PT)	[amountToTranslateWithin:(id)aRectangle] }
{ # (id)	[boundingBox] }
{ # (id)	[clippingRectangle] }
{ # (id)	[compositionRectangle] }
{ # (id)	[computeBoundingBox] }
{ # (id)	[frame] }
{ # (id)	[visibleRectangle] }
{ # (id)	[area:(id)aRectangle] }
{ # (id)	[areasDiffering:(id)aRectangle] }
{ # (id)	[areasOutside:(id)aRectangle] }
{ # (id)	[black:(id)aRectangle] }
{ # (id)	[border:(id)aRectangle width:(int)borderWidth] }
{ # (id)	[border:(id)aRectangle width:(int)borderWidth mask:aHalfTone] }
{ # (id)	[border:(id)aRectangle widthRectangle:(id)insets mask:aHalfTone] }
{ # (id)	[border:(id)aRectangle widthRectangle:(id)insets mask:aHalfTone clipBy:(id)aClipRectList] }
{ # (id)	[clipList:(id)aClipRectList] }
{ # (id)	[clippingRectangle:(id)aRectangle] }
{ # (id)	[compositionRectangle:(id)compRectangle] }
{ # (id)	[compositionRectangle:(id)compositionRect text:aText style:aTextStyle offset:(PT)aPoint outputMedium:(int)aSymbol fitWidth:(BOOL)aBoolean] }
{ # (id)	[copyFrom:(PT)sourcePoint to:(PT)destPoint extent:(PT)extentPoint form:sourceForm clipBy:(id)aClipRectList rule:(int)rule mask:halftoneForm] }
{ # (id)	[copyFromArea:(id)destRectangle toPoint:(PT)destPoint form:sourceForm clipBy:(id)aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyFromArea:(id)sourceRect toPoint:(PT)destOrigin form:sourceForm clipBy:(id)aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyFromArea:(id)sourceRect toPoint:(PT)destOrigin form:sourceForm clipBy:(id)aClipRectList rule:(int)rule mask:aForm] }
{ # (id)	[copyFromArea:(id)sourceRect toPoint:(PT)destOrigin form:sourceForm clipBy:(id)aClipRectList rule:(int)rule mask:halftoneForm] }
{ # (id)	[copyStr:(STR)sourceString font:aFont at:(PT)destOrigin clipBy:(id)aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyToArea:(id)destRectangle fromPoint:(PT)destPoint form:sourceForm rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyToArea:(id)destRectangle fromPoint:(PT)sourcePt form:sourceForm rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[copyToArea:(id)destRectangle fromPoint:(PT)sourcePt form:sourceForm rule:(int)rule mask:halftoneForm] }
{ # (id)	[darkGray:(id)aRectangle] }
{ # (id)	[destForm:df sourceForm:sf halftoneForm:hf combinationRule:(int)rule destOrigin:(PT)destOriginPoint sourceOrigin:(PT)sourceOriginPoint extent:(PT)anExtent clipList:(id)aClipRectList] }
{ # (id)	[destRect:(id)aRectangle] }
{ # (id)	[displayCaretAt:(PT)aPoint andClip:(id)clipBox] }
{ # (id)	[displayOn:aDisplay transformation:displayTransformation clipBy:(id)aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:(id)aClipRectList] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:(id)aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:(id)aClipRectList rule:(int)combinationRule mask:maskForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:(id)aClipRectList rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium at:(PT)aDisplayPoint clipBy:(id)aClipRectList rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:(id)aClipRectList] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:(id)aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:(id)aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:(id)aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:(id)aClipRectList align:(PT)alignmentPoint with:(PT)relativePoint rule:(int)ruleInteger mask:aForm] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:(id)aClipRectList fixedPoint:(PT)aPoint] }
{ # (id)	[displayOn:aDisplayMedium transformation:displayTransformation clipBy:(id)aClipRectList rule:(int)ruleInteger mask:aForm] }
{ # (id)	[drawLine:sourceForm from:(PT)beginPoint to:(PT)endPoint clipBy:(id)aClipRectList rule:(int)anInteger mask:aForm] }
{ # (id)	[drawLine:sourceForm from:(PT)beginPoint to:(PT)endPoint clipBy:(id)aClipRectList rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[drawLineAround:(id)aRectangle clipBy:(id)cr rule:(int)combinationRule] }
{ # (id)	[drawLineFrom:(PT)bp to:(PT)ep clipBy:(id)aClipRectList rule:(int)combinationRule] }
{ # (id)	[drawLineFrom:(PT)bp to:(PT)ep clipBy:(id)aClipRectList rule:(int)rule] }
{ # (id)	[expandByRectangle:(id)aRectangle] }
{ # (id)	[fill:(id)aRectangle] }
{ # (id)	[fill:(id)aRectangle mask:aForm] }
{ # (id)	[fill:(id)aRectangle rule:(int)anInteger mask:aForm] }
{ # (id)	[fill:(id)aRectangle rule:(int)combinationRule mask:halftoneForm] }
{ # (id)	[fill:(id)aRectangle rule:(int)combinationRule mask:halftoneForm clipBy:(id)aClipRectList] }
{ # (id)	[flash:(id)aRectangle] }
{ # (id)	[frame:(id)aClipRectList] }
{ # (id)	[fromDisplay:(id)aRectangle] }
{ # (id)	[gray:(id)aRectangle] }
{ # (id)	[insetByRectangle:(id)aRectangle] }
{ # (id)	[intersect:(id)r] }
{ # (id)	[lightGray:(id)aRectangle] }
{ # (id)	[lock:(id)aRectangle] }
{ # (id)	[merge:(id)r] }
{ # (id)	[mergeWith:(id)r] }
{ # (id)	[moveBy:(PT)aPoint with:(id)aClipRectList] }
{ # (id)	[recomposeIn:(id)compositionRect clipBy:(id)clippingRect] }
{ # (id)	[repositionAt:(PT)aPoint clipBy:(id)clippingBox] }
{ # (id)	[reverse:(id)aRectangle] }
{ # (id)	[reverse:(id)aRectangle mask:aMask] }
{ # (id)	[reverseRectangle:(id)aRectangle] }
{ # (id)	[sourceRect:(id)aRectangle] }
{ # (id)	[toReverse:(id)aRectangle] }
{ # (id)	[veryLightGray:(id)aRectangle] }
{ # (id)	[white:(id)aRectangle] }
{ # (id)	[withText:aText style:aTextStyle compositionRectangle:(id)compRect clippingRectangle:(id)aClipRectList] }
