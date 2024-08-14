#include "unity_fixture.h"
#include "func_multiply.h"

TEST_GROUP(TEST_MULTIPLY);

TEST_SETUP(TEST_MULTIPLY)
{

}

TEST_TEAR_DOWN(TEST_MULTIPLY)
{

}

TEST(TEST_MULTIPLY, CheckMultiply)
{
    TEST_ASSERT_EQUAL(8, multiply(4, 2));
    //Celowy blad
    TEST_ASSERT_EQUAL(1, multiply(1, 4));
}
