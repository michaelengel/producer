{ # BounceInBoxNode (id) BounceInBoxNode }
{ # DisplayObject (id) DisplayObject }
{ # EvaluationNode (id) EvaluationNode }
{ # MovingNode (id) MovingNode }
{ # PositionNode (id) PositionNode }
{ # SequenceNode (id) SequenceNode }
{ # SuperpositionNode (id) SuperpositionNode }
{ # WindowNode (id) WindowNode }
{ # aBlock (id) aBlock }
{ # aCollection (id) aCollection }
{ # aDisplayPoint (PT) aDisplayPoint }
{ # aForm (id) aForm }
{ # boundingBox (id) boundingBox }
{ # c (id) aCollection }
{ # clipRect (id) clipRect }
{ # clipRectangle (id) clipRectangle }
{ # contents (id) contents }
{ # destForm (id) destForm }
{ # evalBlock (id) evalBlock }
{ # index (int) index }
{ # l (PT) locationPoint }
{ # location (PT) location }
{ # node (id) node }
{ # position (PT) position }
{ # relLoc (PT) relLoc }
{ # ruleInteger (int) ruleInteger }
{ # subNodes (id) subNodes }
{ # v (PT) velocityPoint }
{ # velocity (PT) velocity }
{ # window (id) window }

{ (id)displayOn:(id) at:(PT) clippingBox:(id) rule:(int) mask:(id) #
	(id) [displayOn:%1 at:(PT)%2 clipBy:%3 rule:(int)%4 mask:%5] }
{ # [(id)at:(PT)pt] }
{ # [(id)contents:(id)a location:(PT)b ] }
{ # (id)[fixTemps] }
{ # (id)[setBlock:(id)a] }
{ # (id)[setContents:(id)a location:(PT)b] }
{ # (id)[setSubNodes:(id)a ] }
{ # (id)[setVelocity:(PT)a ] }
{ (id)setNodes:(id) index:(int) # (id)[setNodes:(id)nodeCollection index:(int)anInteger] }
{ (id)subNodes:(id) index:(int) # (id)[subNodes:(id)aCollection index:(int)anInteger] }

{ # (BOOL)[anyButtonPressed] }
{ # (id)[block:(BLOCK)aBlock ] }
{ # (id)[contents:(id)aForm location:(PT)aPoint velocity:(PT)velocityPoint ] }
{ # (id)[displayView] }
{ # (id)[extent:(PT)anExtent fromArray:anArray offset:(PT)aPoint ] }
{ # (id)[model:(id)aModel ] }
{ # (PT)[mousePoint] }
{ # (RULE)[over] }
{ (id)pi # (float)'3.414' }
{ # (id)[release] }
{ # (id)[run:(id)aWindowNode ] }
{ # (id)[setWindow:(id)aWindow contents:(id)aCollection ] }
{ # (id)[spiral:(float)anAngle] }
{ # (id)[subNodes:(id)aNode ] }
{ # (id)[window:(id)aWindow contents:(id)aCollection ] }
{ (id)with:(id) with:(id) with:(id) # (id)'[%0 with:3, %1, %2, %3]' }
{ # n (int) n }
{ # (int)[collect:(BLOCK)aBlock ] }
