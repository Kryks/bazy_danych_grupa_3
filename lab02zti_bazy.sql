Czesc1
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
#zad6

Czesc2
#zad1
SELECT imie, nazwisko, nazwa FROM pracownik
INNER JOIN dzial ON dzial.id_dzialu=pracownik.dzial;
#zad2
SELECT nazwa_towaru, nazwa_kategori , ilosc FROM towar
INNER JOIN kategoria ON kategoria.id_kategori=towar.kategoria
INNER JOIN stan_magazynowy ON stan_magazynowy.towar=towar.id_towaru
ORDER BY ilosc DESC;
#zad3
SELECT id_zamowienia,status_zamowienia,nazwa_statusu_zamowienia FROM zamowienie
INNER JOIN status_zamowienia ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia
WHERE nazwa_statusu_zamowienia='anulowane';

