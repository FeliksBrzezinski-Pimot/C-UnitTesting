#include "unity_fixture.h"
#include "fff.h"
#include "test_memory_register.h"

DEFINE_FFF_GLOBALS;

// Zakładamy że get_data działa poprawnie i nie jest obiektem testów
FAKE_VALUE_FUNC(uint32_t, get_data, uint32_t);


TEST_GROUP(TEST_MOCK);

TEST_SETUP(TEST_MOCK)
{

}

TEST_TEAR_DOWN(TEST_MOCK)
{

}

TEST(TEST_MOCK, CheckData)
{
    //Given
    get_data_fake.return_val = 0x00000000;
    
    //When
    uint8_t is_correct = is_correct_data(0x00);
    //Then 
    TEST_ASSERT_EQUAL_HEX8(0x00, is_correct);
    //Celowy blad
    TEST_ASSERT_EQUAL_HEX8(0x01, is_correct);
}