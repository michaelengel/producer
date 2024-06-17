#include "Producer.h"
= Stmt:Node CATEGORIES() { id expr, type; }
+ expr:anExpr { self = [super new]; expr = anExpr; return self; }
- expr { return expr; }
- free { [expr free]; return [super free]; }
- gen {
	[expr gen]; if (type != types.STMT) gc(';'); 
	[successor gen]; return self; 
}
- genExpr { [expr gen];
	if (successor) { if (type != types.STMT) gc(';'); [successor gen]; }
	return self; 
}
- type { 
	if (type) return type;
	type = [expr type]; 
	[successor type];
	return type;
}
