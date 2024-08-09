# Informacje wstępne 

Struktura projektu
---
Ważne jest by zachować poniższą strukturę projektu, inaczej wymagane będzie edytowanie plików makefile
```
├───bin
│
├───src
│   │   main.c
│   │
│   ├───include
│   │       test_func_multiply.h
│   │       test_func_sum.h
│   │
│   └───src
│           test_func.c
│
├───tests
│   └───Unity
│       │   AllTests.c
│       │   Makefile
│       │
│       ├───test_multiply
│       │       test_multiply.c
│       │       test_multiply_runner.c
│       │
│       └───test_sum
│               test_sum.c
│               test_sum_runner.c
│
└───tools
    └───Unity
        │   (...)
```
Objaśnienia co zawierają poszczególne foldery
 - `bin` - ***nie jest częścią repozytorium***, powinien zostać dodany jeśli używany będzie Makefile w głównym folderze do budowania aplikacji "produkcyjnej" (z folderu `src`)
 - `src` - tu znajdują się pliki "produkcyjne" nardzędnym z nich jest `main.c`. Definicje modułów pomocnicznych znajdują się w podfolderze `src` natomiast deklaracje w `include`
 - `tests` - podfoldery zawierają pliki związane z konkrentymi frameworkami. Dla każdego z nich obowiązuje struktura nadrzędnego pliku `AllTests.c` oraz podfolderów `test_<nazwa_modulu>` zawierających pliki definiujące testy
 - `tools` - ***nie jest częścią rezpozytorium***, tutaj powinny być umieszczane pliki związane z frameworkami. Sposób instalacji jest opisany w każdym z modułów.

# Wymagania
Podstawowe narzędzia
---
Niezależnie od wybranego frameworku potrzebne są:
- Narzędzia do procesu buildowania (Make / CMake / $\dots$)
- Kompilator (gcc) 

Oba narzędzia są cześcią **MinGw-w64** - ja wybrałem build od [***WinLibs.com***](https://winlibs.com/). Oczywiście nie ma znaczenia skąd się je weźmie, ważne żeby były.

Instalacja
---

1. Odpakowanie zipa w dowolnym miejscu
2. Dodanie zmiennej środowiskowej do podfolderu *bin* - powinna wyglądać mniej więcej tak **[...]\mingw64\bin** - krok ten pozwoli na uruchamanie narzędzi z dowolnego miejsca
3. Zmiana nazwy pliku (z folderu bin) *mingw32-make.exe* na *make.exe*

By potwierdzić poprawność instalacji należy uruchomić cmd w dowolnym miejscu, które nie jest wcześniej wymienioną ścieżką oraz wpisanie komend:
```
> gcc --version
> make --version
```
Jeśli otrzyma się komunikat informujący o wersji to wszystko jest w porządku :)

# Unity
Oficjalną stronę projektu można znaleźć [tutaj](https://www.throwtheswitch.org/unity). Do instalacji ***nie potrzeba dodatkowych narzędzi***. Instalacja polega na rozpakowaniu zipa wybranej wersji :) W celu przetestowania działania należy wejść do dowolnego folderu *examples* i wykonać komendę *make*. 

&NewLine;

Dla działania rezpozytorium kluczowe są foldery `extras` oraz `src` - cała reszta plików może być usunięta. Sugeruję jednak zostawić sobie jeszcze folder z przykładami :)

&NewLine;

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
```


Schemat działania 
---

