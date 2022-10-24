# Ćwiczenie 1:
Dla każdego z podanych niżej podpunktów zdefiniuj odpowiednie polecenia. 

1. Stwórz blok anonimowy i wyświetl w nim wiadomość: "Hello world!".
2. Stwórz blok anonimowy z 2 zmiennymi:
- a – przechowuje długość boku sześcianu,
- sa (ang. surface area) – przechowuje wielkość pola powierzchni sześcianu wyliczoną na podstawie zmiennej a.
Korzystając z powyższych zmiennych, wyświetl wiadomość:
"Pole szescianu o boku [1] = [2]"
gdzie:
[1] to wartość zmiennej a,
[2] to wartość zmiennej sa.
Czy możliwe jest stworzenie zmiennej stałej do przechowywania długości boku sześcianu?
3. Stwórz blok anonimowy z 3 zmiennymi:
- user_name – przechowuje Twoje imię,
- today – przechowuje aktualną datę i godzinę,
- midnight – przechowuje datę i godzinę najbliższej północy.
Korzystając z powyższych zmiennych, wyświetl wiadomości:
"Witaj [1]!"
"Aktualny czas: [2]"
"Minuty do polnocy: [3]"
gdzie:
[1] to wartość zmiennej user_name,
[2] to godzina ze zmiennej today,
[3] to liczba minut, które zostały do północy, obliczona na podstawie zmiennych today i midnight.
4. Stwórz blok anonimowy i zadeklaruj w nim zmienną this_department_name z wartością Human Resources. Dla wskazanego departamentu pobierz informacje o:
- mieście, w którym znajduje się ten departament,
- numerze telefonu pracownika tego departamentu
oraz zapisz je w nowych zmiennych. Wyświetl wartości wszystkich zmiennych razem z dodanymi opisami do wyświetlanych informacji. W rozwiązaniu wykorzystaj type.
5. Stwórz blok anonimowy i zadeklaruj w nim zmienną this_city z wartością Tokyo. Dla wskazanego miasta pobierz wszystkie informacje o lokalizacji i zapisz je w nowej zmiennej. Wyświetl wartości nowych zmiennych razem z dodanymi opisami do wyświetlanych informacji. W rozwiązaniu wykorzystaj rowtype.
Zmień wartość zmiennej this_city na London. Sprawdź nowe wartości wyświetlane w wiadomości.
6. Stwórz blok anonimowy i zadeklaruj w nim dwie zmienne:
- pierwsza zmienna przechowuje liczbę wylosowaną z przedziału zamkniętego od 100 do 1000,
- druga zmienna przechowuje tekst, który zostaje wyświetlony jako ostatnia czynność wykonywana w bloku.
Tekst informujący o wylosowanej liczbie przyjmuje 1 z 2 wartości w zależności od wartości liczby:
– "Wylosowano: [1]. Jest to liczba parzysta!",
– "Wylosowano: [1]. Jest to liczba nieparzysta!"
gdzie
[1] to wartość wylosowanej liczby.
W rozwiązaniu wykorzystaj instrukcję warunkową case.
7. Podaj nazwy departamentów oraz informację o ich menadżerze:
- "Brak menadzera" w przypadku, gdy department nie ma podanego menadżera,
- "Prezes firmy" w przypadku, gdy menadżer departamentu zajmuje stanowisko President,
- "Menadzer" w pozostałych przypadkach.
Kolumnę z informacją o menadżerze nazwij manager_info. W rozwiązaniu wykorzystaj instrukcję warunkową case.
8. Podaj imię i nazwisko pracowników oraz nazwę ich departamentu i ich wynagrodzenie. Wynik ogranicz w zależności od wysokości wynagrodzenia w następujący sposób:
- uwzględnij tylko tych pracowników z departamentu Executive, którzy zarabiają co najmniej 20 000,
- uwzględnij tylko tych pracowników z departamentu Sales lub Finance, którzy zarabiają co najmniej 10 000,
- uwzględnij tylko tych pracowników z pozostałych departamentów, którzy zarabiają co najmniej 5 000.
W rozwiązaniu wykorzystaj instrukcję warunkową case w klauzuli where.
9. Stwórz blok anonimowy i zadeklaruj w nim zmienną przechowującą tekst składający się z dowolnych znaków. Wyświetl 1 z 3 informacji w zależności od wartości zmiennej tekstowej:
- "Drugi znak tekstu to cyfra.",
- "Drugi znak tekstu to litera.",
- "Drugi znak tekstu nie jest cyfra ani litera.".
W rozwiązaniu wykorzystaj instrukcję warunkową if.
10. Stwórz blok anonimowy i zadeklaruj w nim odpowiednie zmienne. Jeżeli łączne wynagrodzenie pracowników na stanowisku Programmer mieści się w przedziale zamkniętym dla minimalnego i maksymalnego wynagrodzenia dla stanowiska President, to wyświetl wiadomość:
"Suma wynagrodzen pracownikow na stanowisku [1] miesci sie w przedziale minimalnego i maksymalnego wynagrodzenia dla stanowiska [2]."
gdzie
[1] to wartość zmiennej przechowującej nazwę stanowiska dla obliczanej sumy wynagrodzeń,
[2] to wartość zmiennej przechowującej nazwę stanowiska dla przedziału kwot wynagrodzeń.
W rozwiązaniu wykorzystaj instrukcję warunkową if.
11. Przeanalizuj poniższy ciąg wartości i znajdź zależności:
/5.
/4.
/4.1.
/4.3.
/4.4.
/3.
/3.1.
/3.3.
/2.
/2.1.
/1.
/1.1.
Napisz blok anonimowy, który wyświetla powyższe wartości. W rozwiązaniu wykorzystaj pętlę loop oraz funkcje exit i continue.
12. Stwórz blok anonimowy i zadeklaruj w nim odpowiednie zmienne. Wyświetl nazwy kolejnych departamentów zaczynając od departamentu z ID równym 10 i kończąc na departamencie z ID równym 100. Załóż, że w bazie danych nie brakuje żadnych wartości ID departamentów w powyższym przedziale, gdzie krok wynosi 10. W rozwiązaniu wykorzystaj pętlę while.
13. Stwórz blok anonimowy i zadeklaruj w nim odpowiednie zmienne. Wyświetl imię i nazwisko kolejnych pracowników zaczynając od pracownika z ID równym 150 i kończąc na pracowniku z ID równym 160. Załóż, że w bazie danych nie brakuje żadnych wartości ID pracowników w powyższym przedziale. Dla każdego pracownika wyświetl dodatkowo tyle znaków gwiazdki (*), ile pełnych lat pracuje on już w firmie na aktualnym stanowisku. W rozwiązaniu wykorzystaj pętlę while. 
14. Stwórz blok anonimowy i zadeklaruj w nim odpowiednie zmienne. Wyświetl nazwę kolejnych departamentów uwzględniając wszystkie z bazy danych. Załóż, że w bazie danych nie brakuje żadnych wartości ID departamentów w przedziale od najmniejszego do największego numeru ID, gdzie krok wynosi 10. Dla każdego departamentu wyświetl dodatkowo liczbę ich pracowników. W rozwiązaniu wykorzystaj pętlę for. 
15. Stwórz blok anonimowy i zadeklaruj w nim odpowiednie zmienne. Wyświetl w formie listy numerowanej imię i nazwisko pracowników, którzy pracują w mieście South San Francisco. Przed listą numerowaną wyświetl nazwę miasta, którego ona dotyczy. W rozwiązaniu wykorzystaj pętlę if oraz funkcję row_number.
16. Zmodyfikuj swoje rozwiązanie z zadania 5 w taki sposób, aby zmienne bez wartości nie były wyświetlane. W rozwiązaniu wykorzystaj instrukcje warunkowe (oraz etykiety i funkcję goto).
