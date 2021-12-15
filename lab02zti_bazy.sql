#zad1
select * from pracownik order by nazwisko ASC;
#zad2
select imie,nazwisko,pensja,data_urodzenia from pracownik where data_urodzenia>'1979-01-01';
#zad3
select * from pracownik where pensja between 3500 AND 5000;
#zad4
select * from stan_magazynowy where ilosc>10 ;
#zad5
select * from towar where  (nazwa_towaru LIKE'A%' OR nazwa_towaru LIKE'B%' OR nazwa_towaru LIKE  'C%');
