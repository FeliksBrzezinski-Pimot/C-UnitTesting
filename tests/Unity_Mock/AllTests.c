#include "unity_fixture.h"

static void RunAllTests(void)
{
  RUN_TEST_GROUP(TEST_SUM);
  RUN_TEST_GROUP(TEST_MULTIPLY);
  RUN_TEST_GROUP(TEST_POWER);
}

int main(int argc, const char * argv[])
{
  return UnityMain(argc, argv, RunAllTests);
}