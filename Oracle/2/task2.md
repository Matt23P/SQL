## Ćwiczenie 1:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenie. 

1. Stwórz nową tabelę visitors opisującą osoby odwiedzające firmę. Tabela powinna zawierać kolumny:
- visitor_id – klucz główny z domyślną autonumeracją od 100 co 10,
- enter_datetime - datę i godzinę rozpoczęcia wizyty,
- exit_datetime - datę i godzinę zakończenia wizyty,
- employee_id – klucz obcy do tabeli employees odwołujący się do pracownika przyjmującego odwiedzających,
- company – nazwa firmy, którą reprezentują osoby odwiedzające,
- people_number – liczba osób odwiedzających,
- parking – informacja, czy odwiedzający korzystali z firmowego parkingu.
Dodatkowo zadbaj o:
- konieczność wprowadzenia wartości w employee_id,
- wprowadzenie ograniczenia na wartości w exit_datetime (data i czas muszą być późniejsze niż wartość w enter_datetime),
- wprowadzenie domyślnej wartości aktualnej daty i czasu w enter_datetime.
2. Dodaj dane o osobach odwiedzających pracownika Daniela Faviet:
- jeden pracownik firmy RSM przyszedł na 1-godzinne spotkanie w dniu 20.09.2022 o godzinie 9:00,
- trzech pracowników firmy KPMG przyszło na 1,5-godzinne spotkanie w dniu 21.09.2022 o godzinie 10:00 i skorzystali z parkingu firmowego.
3. Usuń kolumnę parking z tabeli visitors.
4. Przypisz odwiedzających z firmy RSM do pracownika Johna Chen, który faktycznie był z nimi na spotkaniu.
5. Usuń wszystkie informacje o odwiedzających pracownika Daniela Faviet. 
6. Usuń kaskadowo tabelę visitors. 
## Ćwiczenie 2:
Dla każdego z podanych niżej poleceń zdefiniuj odpowiednie zapytanie SELECT. 

1. Podaj obliczone wartości miejsc zerowych funkcji y = 8x2 + 2x - 3 (nazwij te kolumny jako x1 i x2).
2. Podaj imię i nazwisko wszystkich pracowników oraz ich e-mail zakodowany wg. następujących zasad:
- wszystkie samogłoski są zamienione na cyfry zgodnie z ich kolejnością w alfabecie (np. A to 1, E to 2, itd.),
- wszystkie wielkie litery są zamienione na małe litery,
- e-mail jest zapisany od tyłu (np. SQL to LQS).
Kolumnę z kodem nazwij jako email_code.
3. Podaj:
- liczbę prowincji lokalizacji wpisanych do bazy danych,
- liczbę lokalizacji wprowadzonych do bazy danych obliczoną na podstawie pola state_province w tabeli locations.
W rozwiązaniu wykorzystaj funkcję nvl.
4. Podaj:
- minimalną różnicę pomiędzy maksymalnym i minimalnym wynagrodzeniem dla wszystkich stanowisk,
- drugą w kolejności minimalną różnicę pomiędzy maksymalnym i minimalnym wynagrodzeniem dla wszystkich stanowisk.
W rozwiązaniu wykorzystaj funkcję nullif.
5. Podaj nazwę departamentu lub departamentów, w których pracuje więcej pracowników niż wynosi średnia liczba pracowników przypadająca na wszystkie departamenty zapisane w bazie danych. W rozwiązaniu wykorzystaj klauzulę with.
6. Podaj imię i nazwisko pracowników, nazwy ich stanowisk oraz informację o aktualności danego stanowiska pracownika:
- "actual" w przypadku, gdy dane stanowisko jest aktualnym stanowiskiem pracownika,
- "archive" w przypadku, gdy dane stanowisko jest poprzednim stanowiskiem pracownika (pracownik awansował lub zmienił stanowisko w firmie).
Wynik posortuj alfabetycznie według nazwisk, a następnie według imion pracowników. W rozwiązaniu wykorzystaj operator union lub union all.
7. Podaj nazwy miast, w których znajdują się departamenty z przypisanym menadżerem. Wynik ogranicz do miast, które są w United States of America. W rozwiązaniu wykorzystaj operator intersect.
8. Podaj nazwy departamentów, w których nie pracuje żaden pracownik. W rozwiązaniu wykorzystaj operator minus.
9. Podaj imię i nazwisko pracowników, którzy podlegają pod menadżer Neena Kochhar zgodnie z hierarchią w firmie. Do każdego takiego pracownika dopisz jego poziom. Na liście pracowników pomiń menadżer Neena Kochhar. W rozwiązaniu wykorzystaj rekurencję, klauzulę with oraz operator union all.
Oczekiwany wynik:
employee_level   first_name       last_name
-1               Nancy            Greenberg
-1               Jennifer         Whalen
-1               Susan            Mavris
-1               Hermann          Baer
-1               Shelley          Higgins
-2               William          Gietz
-2               Daniel           Faviet
-2               John             Chen
-2               Ismael           Sciarra
-2               Jose Manuel      Urman
-2               Luis             Popp
Wytłumaczenie:
Pracowniczka Neena Kochhar jest menadżerem, zatem jest pracownikiem na poziomie 0 i nie jest wyświetlana w wyniku. Pracownik Hermann Baer podlega pod Neena Kochhar, więc jest na poziomie -1. Pracownik Luis Popp podlega pod pracownika z poziomu -1, zatem on sam jest na poziomie -2.
