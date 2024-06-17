#include "Producer.h"
= Return:Node CATEGORIES() { id body; }
+ expr:anExpr { self = [super new]; body = anExpr; return self; }
- gen { [self genExpr]; gc(';'); return self; }
- genExpr { gs("return "); [body gen]; return self; }
- free { [body free]; return [super free]; }
- type { return [body type]; }
