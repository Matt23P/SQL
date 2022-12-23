# Transakcje, współbieżność i blokady
## Ćwiczenie 1:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. Wyświetl wszystkie aktywne transakcje.
2. Wyświetl minimalną pensję na stanowisku Accountant.
3. Rozpocznij transakcję.
4. Obniż o 1000 zł minimalną pensję na stanowisku Accountant.
5. Wyświetl wszystkie aktywne transakcje.
6. Wyświetl minimalną pensję na stanowisku Accountant.
7. Zatwierdź transakcję.
8. Wyświetl wszystkie aktywne transakcje.
9. Wyświetl minimalną pensję na stanowisku Accountant.

## Ćwiczenie 2:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. Wyświetl wszystkie aktywne transakcje.
2. Wyświetl minimalną pensję na stanowisku Accountant.
3. Rozpocznij transakcję.
4. Podwyższ o 1000 zł minimalną pensję na stanowisku Accountant.
5. Wyświetl wszystkie aktywne transakcje.
6. Wyświetl minimalną pensję na stanowisku Accountant.
7. Wycofaj transakcję.
8. Wyświetl wszystkie aktywne transakcje.
9. Wyświetl minimalną pensję na stanowisku Accountant.

## Ćwiczenie 3:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. Wyświetl wszystkie aktywne transakcje.
2. Wyświetl minimalną pensję na stanowisku Accountant.
3. Rozpocznij transakcję.
4. Podwyższ o 1000 zł minimalną pensję na stanowisku Accountant.
5. Wyświetl wszystkie aktywne transakcje.
6. Wyświetl minimalną pensję na stanowisku Accountant.
7. Utwórz punkt zapisu o nazwie new_checkpoint.
8. Wyświetl wszystkie aktywne transakcje.
9. Obniż o 1000 zł minimalną pensję na stanowisku Accountant.
10. Wyświetl minimalną pensję na stanowisku Accountant.
11. Wycofaj transakcję do punktu zapisu new_checkpoint.
12. Wyświetl wszystkie aktywne transakcje.
13. Wyświetl minimalną pensję na stanowisku Accountant.
14. Zatwierdź transakcję.
15. Wyświetl wszystkie aktywne transakcje.
16. Wyświetl minimalną pensję na stanowisku Accountant.

## Ćwiczenie 4:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. Przygotuj skrypt nr 1:
* Rozpocznij transakcję.
* Zadeklaruj zmienną o nazwie salary.
* Przypisz jej wartość minimalnej pensji na stanowisku Accountant.
* Wstrzymaj wykonanie skryptu na 15 sekund.
* Obniż o 1000 zł wartość zmiennej salary.
* Ustaw minimalną pensję na stanowisku Accountant na wartość zmiennej salary.
* Wyświetl wartość zmiennej salary.
* Zatwierdź transakcję.
2. Przygotuj skrypt nr 2:
* Rozpocznij transakcję.
* Zadeklaruj zmienną o nazwie salary.
* Przypisz jej wartość minimalnej pensji na stanowisku Accountant.
* Obniż o 2000 zł wartość zmiennej salary.
* Ustaw minimalną pensję na stanowisku Accountant na wartość zmiennej salary.
* Wyświetl wartość zmiennej salary.
* Zatwierdź transakcję.
3. Uruchom skrypt nr 1 i zaraz po nim skrypt nr 2 w ramach dwóch różnych sesji.
4. Wyświetl minimalną pensję na stanowisku Accountant.
5. Jakie zjawisko zaprezentowano w tym ćwiczeniu?
6. Na jakim minimalnym poziomie izolacji nie mogłoby dojść do jego wystąpienia?

## Ćwiczenie 5:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. W ramach sesji nr 1 rozpocznij transakcję.
2. W ramach sesji nr 1 wyświetl minimalną pensję na stanowisku Accountant.
3. W ramach sesji nr 2 rozpocznij transakcję.
4. W ramach sesji nr 2 podwyższ o 1000 zł minimalną pensję na stanowisku Accountant.
5. W ramach sesji nr 2 zatwierdź transakcję.
6. W ramach sesji nr 1 wyświetl minimalną pensję na stanowisku Accountant.
7. W ramach sesji nr 1 zatwierdź transakcję.
8. W ramach sesji nr 1 wyświetl minimalną pensję na stanowisku Accountant.
9. Jakie zjawisko zaprezentowano w tym ćwiczeniu?
10. Na jakim minimalnym poziomie izolacji nie mogłoby dojść do jego wystąpienia?

## Ćwiczenie 6:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. W ramach sesji nr 1 rozpocznij transakcję.
2. W ramach sesji nr 1 wyświetl wszystkie stanowiska, na których maksymalna pensja wynosi 15000 zł.
3. W ramach sesji nr 2 rozpocznij transakcję.
4. W ramach sesji nr 2 dodaj nowe stanowisko, na którym maksymalna pensja wynosi 15000 zł.
5. W ramach sesji nr 2 zatwierdź transakcję.
6. W ramach sesji nr 1 wyświetl wszystkie stanowiska, na których maksymalna pensja wynosi 15000 zł.
7. W ramach sesji nr 1 zatwierdź transakcję.
8. W ramach sesji nr 1 wyświetl wszystkie stanowiska, na których maksymalna pensja wynosi 15000 zł.
9. Jakie zjawisko zaprezentowano w tym ćwiczeniu?
10. Na jakim minimalnym poziomie izolacji nie mogłoby dojść do jego wystąpienia?

## Ćwiczenie 7:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. W ramach sesji nr 1 rozpocznij transakcję.
2. W ramach sesji nr 1 wyświetl listę wszystkich obiektów z założoną blokadą.
3. W ramach sesji nr 1 na cały czas trwania transakcji załóż blokadę dzieloną na tabeli stanowisk.
4. W ramach sesji nr 1 wyświetl listę wszystkich obiektów z założoną blokadą.
5. W ramach sesji nr 2 rozpocznij transakcję.
6. W ramach sesji nr 2 wyświetl wszystkie stanowiska.
7. W ramach sesji nr 2 obniż o 100 zł minimalną pensję na wszystkich stanowiskach.
8. W ramach sesji nr 1 zatwierdź transakcję.
9. W ramach sesji nr 2 wycofaj transakcję.
10. W ramach sesji nr 1 wyświetl listę wszystkich obiektów z założoną blokadą.
11. W którym momencie udało Ci się podwyższyć pensję wszystkich pracowników w ramach sesji nr 2?

## Ćwiczenie 8:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. W ramach sesji nr 1 rozpocznij transakcję.
2. W ramach sesji nr 1 wyświetl listę wszystkich obiektów z założoną blokadą.
3. W ramach sesji nr 1 na cały czas trwania transakcji załóż blokadę wyłączną na tabeli stanowisk.
4. W ramach sesji nr 1 wyświetl listę wszystkich obiektów z założoną blokadą.
5. W ramach sesji nr 1 obniż o 100 zł minimalną pensję na wszystkich stanowiskach.
6. W ramach sesji nr 2 rozpocznij transakcję.
7. W ramach sesji nr 2 wyświetl wszystkie stanowiska.
8. W ramach sesji nr 1 wycofaj transakcję.
9. W ramach sesji nr 2 zatwierdź transakcję.
10. W ramach sesji nr 1 wyświetl listę wszystkich obiektów z założoną blokadą.
11. W którym momencie udało Ci się wyświetlić wszystkich pracowników w ramach sesji nr 2?

## Ćwiczenie 9:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia.

1. Przygotuj skrypt nr 1:
* Rozpocznij transakcję.
* Ustaw maksymalną pensję na stanowisku Accountant na 10000 zł.
* Wstrzymaj wykonanie skryptu na 15 sekund.
* Ustaw pensję pracownika o identyfikatorze równym 109 na 10000 zł.
* Zatwierdź transakcję.
2. Przygotuj skrypt nr 2:
* Rozpocznij transakcję.
* Ustaw pensję pracownika o identyfikatorze równym 109 na 10000 zł.
* Wstrzymaj wykonanie skryptu na 15 sekund.
* Ustaw maksymalną pensję na stanowisku Accountant na 10000 zł.
* Zatwierdź transakcję.
3. Uruchom skrypt nr 1 i zaraz po nim skrypt nr 2 w ramach dwóch różnych sesji.
4. Poczekaj, aż zostanie wyświetlony odpowiedni komunikat.
5. Jakie zjawisko zaprezentowano w tym ćwiczeniu?