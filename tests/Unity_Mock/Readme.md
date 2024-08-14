# Informacje wstępne
Wymagania
---
Do działania potrzebne są:
- `make + gcc`
- `CMake`
- `Unity`
- `FFF` - opcjonalne 

O ich instalacji można przeczytać tutaj: [instalacja GNU](../../Readme.md#instalacja), [instalacja unity](../../Readme.md#instalacja-unity) oraz [instalacja FFF](../../Readme.md#instalacja-FFF).

# Struktura
Projekt powinien mieć strukturę jak poniżej:
```
│   AllTests.c
│   CMakeLists.txt
│   create_test.bat
│   Readme.md
│
├───build
│   │   AllTests.exe
│   │   (...)
│
├───mocks
│   │   (...)
├───test_<nazwa_modulu>
│       CMakeLists.txt
│       test_<nazwa_modulu>.c
│       test_<nazwa_modulu>_runner.c
```
Objaśnienia odnośnie plików i podfolderów:
- `AllTests.c` - plik nadrzędny, który odpowiada za uruchamianie testów 
- `CMakeLists.txt` - nadrzędny plik CMake 
- `create_test.bat` - pomocniczy skrypt Batch, który pozwala na semi-automatyczne wygenerowanie podfolderu dla testu. O tym jak tworzyć i uruchamiać testy więcej w [tej sekcji](#tworzenie-testów)
- `run_tests.bat` - pomocniczy skrypt Batch, który dokonuje procesu generowania plików CMake ich uruchamiania i wyświetlania wyników testów.
- `build` - ***nie jest częścią repozytorium - należy go utworzyć samodzielnie -*** tutaj CMake będzie budował swoje pliki oraz tutaj będzie znajdował się wynikowy plik .exe
- `mocks` - podfolder, w którym docelowo powinny znajdować się pliki z mockami. 

# Uruchamianie testów
Przez skrypt
---
By nie musieć wędrować po folderach i wklepywać komend można uruchomić skrypt batch:
```
(...)\Unity_Mock > .\run_tests.bat
```

Ręcznie
---
By móc uruchomić testy ***MUSI*** istnieć folder `build`. Wynika to z faktu, że to do niego zrzucane są wszystkie pliki generowane przez CMake. Przy pierwszym uruchomieniu testów należy użyć komendy 
```
(...)\Unity_Mock > cmake -S . -B .\build\ -G "MinGW Makefiles"
```
Argument `S` wskazuje na to w jakim folderze znajduje się plik `CMakeLists.txt`, `B` mówi o tym gdzie zrzucane będą wszystkie pliki, natomiast `G` definiuje jakie pliki powinny być generowane - w tym przypadku będą to pliki typu Makefile. 

Przy kolejnych testach do przebudowania plików generowanych przez CMake wystarczy użyć 
```
(...)\Unity_Mock > cmake -S . -B .\build\ 
```
By uruchomić pliki wygenerowane przez CMake należy wpisać:
```
(...)\Unity_Mock > cmake --build .\build\ 
```
Jeśli wszystko zostało wykonane poprawnie w podfolderze `build` powinien być widoczny plik `AllTests.exe`. Po jego uruchomieniu widoczne będą wyniki testów. 

# Tworzenie testów 
By utworzyć w pełni nowy moduł testów najprościej jest posłużyć się skryptem
```
(...)\Unity_Mock > .\create_test.bat nazwa_modułu
```
Generalnie schemat konfiguracji plików i pisania kodu jest następujący:
1. Tworzymy grupę testów w pliku `test_<nazwa_modulu>.c`
2. Dodajemy grupę testów do pliku `AllTests.c` 
3. Edytujemy wstępnie plik CMake
4. Piszemy testy 
5. Dodajemy napisane testy do `test_<nazwa_modulu>_runner.c`

Edycja pliku CMake
---
Na start wystarczy zmienić jedynie dwie linijki mianowicie
```
set(MODULE_NAME "<nazwa_modulu>")
set(MODULE_NAME "<nazwa_modulu>" PARENT_SCOPE)
```
Wpisujemy po prostu nazwę modułu (bez <>) w tych dwóch miejscach. Czyli przykładowo dla pliku `CMakeLists.txt` w folderze `test_sum` należy wpisać "sum". 

W razie chęci zmockowania jakiegoś modułu, który znajduje się w innym pliku należy rozszerzyć listę plików wchodzących w skład biblioteki:
```
set(SRC_FILES 
    "test_${MODULE_NAME}.c"
    "test_${MODULE_NAME}_runner.c"
    <ścieżka do mocka>/<nazwa mocka>.c
    <nazwa mocka w tym folderze>.c
)
```
I tyle :)