#include "Producer.h"
= List:OrdCltn CATEGORIES()
#ifndef COXLIB
- gen { [self elementsPerform:_cmd]; return self; }
#else
- gen { [self eachElementPerform:_cmd]; return self; }
#endif
