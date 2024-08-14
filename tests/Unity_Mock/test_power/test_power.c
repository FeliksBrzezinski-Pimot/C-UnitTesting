#include "unity_fixture.h"
#include "fff.h"
#include "func_power.h"

DEFINE_FFF_GLOBALS;

// Zakładamy że get_data działa poprawnie i nie jest obiektem testów
FAKE_VALUE_FUNC(int, multiply, int);


TEST_GROUP(TEST_POWER);

TEST_SETUP(TEST_POWER)
{

}

TEST_TEAR_DOWN(TEST_POWER)
{

}

TEST(TEST_POWER, Square)
{
    //Given
    multiply_fake.return_val = 10;
    
    //When
    int square = power(2, 2);
    //Then 
    TEST_ASSERT_EQUAL(4, square);
}