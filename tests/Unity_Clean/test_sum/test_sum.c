#include "unity_fixture.h"
#include "func_sum.h"

TEST_GROUP(TEST_SUM);

TEST_SETUP(TEST_SUM)
{

}

TEST_TEAR_DOWN(TEST_SUM)
{

}

TEST(TEST_SUM, CheckSum)
{
    TEST_ASSERT_EQUAL(4, sum(2, 2));
    //Celowy blad
    TEST_ASSERT_EQUAL(5, sum(2, 2));
}