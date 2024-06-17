#ifndef PRODUCERTEST_H
#	include "Layers.h"
#	define ARYSIZ(x) (sizeof(x)/sizeof(*x))
#	define strEq(a, b) (strcmp(a, b) == 0)

#	undef CATEGORIES()
#	define CATEGORIES() (ProducerTest, Collecting, Primitive)
#	define unknown id
#	define PRODUCERTEST_H
#endif
