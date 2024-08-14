# Informacje wstępne 
Struktura projektu
---
Ważne jest by zachować poniższą strukturę projektu, inaczej wymagane będzie edytowanie plików makefile
```
│       
├───bin
│
├───src
│   │   main.c
│   │
│   ├───include
│   │       func_multiply.h
│   │       func_power.h
│   │       func_sum.h
│   │
│   └───src
│           func_multiply.c
│           func_power.c
│           func_sum.c
│
├───tests
│   ├───Unity_Clean
│   │
│   └───Unity_Mock
│
└───tools
    ├───FFF
    │       (...)
    │
    ├───Unity
    │       (...)
```

Objaśnienia co zawierają poszczególne foldery
 - `bin` - ***nie jest częścią repozytorium***, powinien zostać dodany jeśli używany będzie Makefile w głównym folderze do budowania aplikacji "produkcyjnej" (z folderu `src`)
 - `src` - tu znajdują się pliki "produkcyjne" nardzędnym z nich jest `main.c`. Definicje modułów pomocnicznych znajdują się w podfolderze `src` natomiast deklaracje w `include`
 - `tests` - podfoldery zawierają pliki związane z konkrentymi frameworkami. 
 - `tools` - ***nie jest częścią rezpozytorium***, tutaj powinny być umieszczane pliki związane z frameworkami. Sposób instalacji jest opisany w każdym z modułów.

Kod produkcyjny
---
Ponieważ normalnie testy koegzystują z "kodem produkcyjnym" w repozytorium znajduje się Makefile (w głównym katalogu repozytorium), który odpowiada za budowanie kodu znajdującego się w folderze `src`. Jego plik .exe jest generowany do folderu `bin`.

Frameworki
---
Testy oraz pliki związane z frameworkami można znaleźć w podkatalogach folderu `tests`:
- [Unity_Clean](./tests/Unity_Clean/Readme.md#informacje-wstępne) - zawiera przykładowy projekt oparty o Unity, nie uwzględnie możliwości mockowania. Możliwie minimalny i prosty
- [Unity_Mock](./tests/Unity_Mock/Readme.md#informacje-wstępne) - jest rozszerzonym projektem, który uwzględnia możliwość mockowania przy użyciu  FFF. Bardziej skomplikowany, ale ze względu na problemy z linkowaniem musi taki być. Korzysta z CMake'ów.

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
3. Utworzenie kopii pliku (z folderu bin) mingw32-make.exe*
4. Zmiana nazwy jednego z plików mingw32-make.exe* na *make.exe*

By potwierdzić poprawność instalacji należy uruchomić cmd w dowolnym miejscu, które nie jest wcześniej wymienioną ścieżką oraz wpisanie komend:
```
> gcc --version
> make --version
```
Jeśli otrzyma się komunikat informujący o wersji to wszystko jest w porządku :)

# Instalacja Unity 
Oficjalną stronę projektu można znaleźć [tutaj](https://www.throwtheswitch.org/unity). Do instalacji ***nie potrzeba dodatkowych narzędzi***. Instalacja polega na rozpakowaniu zipa wybranej wersji :) W celu przetestowania działania należy wejść do dowolnego folderu *examples* i wykonać komendę *make*. 

Dla działania rezpozytorium kluczowe są foldery `extras` oraz `src` - cała reszta plików może być usunięta. Sugeruję jednak zostawić sobie jeszcze folder z przykładami :)

# Instalacja FFF
*Fake Function Framework* składa się jedynie z pliku nagłówkowego i jest frameworkiem służącym do mockowania funkcji. Oficjalne repozytorium można znaleźć [tutaj](https://github.com/meekrosoft/fff). Instalacja polega na umieszczeniu pliku `fff.h` pod ścieżką `./tools/FFF/`. 