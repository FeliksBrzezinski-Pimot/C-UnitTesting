#include "func_power.h"
#include "func_multiply.h"

// Przykladowy moduł który zawiera zależności od innych modułów
int power(int a, int power)
{
	int result = a;
	for(int i = 0; i < power; i++)
		result = multiply(result, a);
	
	return result;
}