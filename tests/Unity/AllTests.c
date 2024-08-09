#include "unity_fixture.h"

static void RunAllTests(void)
{
  RUN_TEST_GROUP(TEST_SUM);
  RUN_TEST_GROUP(TEST_MULTIPLY);
}

int main(int argc, const char * argv[])
{
  return UnityMain(argc, argv, RunAllTests);
}