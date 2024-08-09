# Informacje wstępne 
Struktura projektu:
```
C:.
│   .gitignore
│   Makefile
│   Readme.md
│
├───bin
│
├───src
│   │   main.c
│   │
│   ├───include
│   │       test_func.h
│   │
│   └───src
│           test_func.c
│
├───tests
│   │   AllTests.c
│   │
│   ├───testx
│   │       
└───tools
```

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
