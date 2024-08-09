#include "unity_fixture.h"
#include "test_func.h"

TEST_GROUP(TEST1);

TEST_SETUP(TEST1)
{

}

TEST_TEAR_DOWN(TEST1)
{

}

TEST(TEST1, CheckSum)
{
    TEST_ASSERT_EQUAL(3, sum(1, 2));
    TEST_ASSERT_EQUAL(-1, sum(1, -2));
}
