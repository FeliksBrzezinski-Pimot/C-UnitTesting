# Informacje wstępne
Wymagania
---
Do działania potrzebne są:
- `make + gcc`
- `Unity`

O ich instalacji można przeczytać tutaj: [instalacja GNU](../../Readme.md#instalacja), [instalacja unity ](../../Readme.md#instalacja-unity).

Tworzenie i uruchamianie testów 
---
Schemat działania jest stosunkowo prosty. Jeśli chcemy dodać testy do nowego modułu w pierwszej kolejności robimy folder i umieszczamy w nim dwa pliki:
```
│   AllTests.c
│   AllTests.exe
│   Makefile
│
├───test_<nazwa_modulu>
│       test_<nazwa_modulu>.c
│       test_<nazwa_modulu>_runner.c
```
W pliku `test_<nazwa_modulu>.c` definiujemy testy, natomiast w `test_<nazwa_modulu>_runner.c`definiujemy jakie testy chcemy by były uruchamiane. W międzyczasie modifikujemy plik `AllTests.c` dodając tam naszą grupę testów. Gdy skończymy i stwierdzimy, że chcemy rozpocząć proces testowania uruchamiamy terminal i wpisujemy
```
> make
```
Przykładowy output
```
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o ../../tools/Unity/src/unity.o ../../tools/Unity/src/unity.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o ../../tools/Unity/extras/memory/src/unity_memory.o ../../tools/Unity/extras/memory/src/unity_memory.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o ../../tools/Unity/extras/fixture/src/unity_fixture.o ../../tools/Unity/extras/fixture/src/unity_fixture.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o ../../src/src/test_func.o ../../src/src/test_func.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o test_multiply/test_multiply.o test_multiply/test_multiply.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o test_multiply/test_multiply_runner.o test_multiply/test_multiply_runner.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o test_sum/test_sum.o test_sum/test_sum.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o test_sum/test_sum_runner.o test_sum/test_sum_runner.c
gcc -Wall -I../../src/include -I../../tools/Unity/src -I../../tools/Unity/extras/memory/src -I../../tools/Unity/extras/fixture/src   -c -o AllTests.o AllTests.c
===================================
Linking...
===================================
gcc  ../../tools/Unity/src/unity.o  ../../tools/Unity/extras/memory/src/unity_memory.o  ../../tools/Unity/extras/fixture/src/unity_fixture.o  ../../src/src/test_func.o  ./test_multiply/test_multiply.o  ./test_multiply/test_multiply_runner.o  ./test_sum/test_sum.o  ./test_sum/test_sum_runner.o  ./AllTests.o -o AllTests
===================================
         Finished build
===================================
Build: OK
`                                 `
`                                 `
===================================
           Run tests
===================================
./AllTests
Unity test run 1 of 1
.test_sum/test_sum.c:20:TEST(TEST_SUM, CheckSum):FAIL: Expected 5 Was 4
.test_multiply/test_multiply.c:20:TEST(TEST_MULTIPLY, CheckMultiply):FAIL: Expected 1 Was 4


-----------------------
2 Tests 2 Failures 0 Ignored
FAIL
make: *** [makefile:73: all] Error 2
```
Jeśli chcemy podejrzeć ostatni wynik testów w terminalu wpisujemy:
```
.\AllTests.exe