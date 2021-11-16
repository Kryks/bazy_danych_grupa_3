#LAB 05

#Zadanie 1

#jestesmy na immennej bazie

CREATE TABLE kreatura SELECT * from wikingowie.kreatura;

#aktywna baza wikingowie
 #zadanie1.1
CREATE TABLE kryksp.zasob SELECT * from zasob;
CREATE TABLE kryksp.kreatura SELECT * from kreatura;
CREATE TABLE kryksp.ekwipunek SELECT * from ekwipunek;


#zadanie 1.2
select * from zasob;

#zadanie 1.3
select * from zasob where rodzaj='jedzenie';
#zadanie 1.4
select idZasobu , nazwa from zasob where idZasobu IN(3,5,7);

#zadanie 2.1

SELECT * from kreatura where rodzaj IN( 'ryba', 'wiking','waz','ptak','malpa') AND udzwig>=50;

SELECT * from kreatura where rodzaj NOT IN( 'wiedzma') AND udzwig>=50;
#zadanie 2.2

SELECT * from zasob where waga>=2 and waga<=5;

SELECT * from zasob WHERE waga BETWEEN 2 AND 5;

#zadanie 2.3
SELECT * from kreatura  WHERE waga BETWEEN 30 AND 70 AND nazwa LIKE '%or%'  ;

#zadanie 3.1
select dataPozyskania from zasob where month(datapozyskania) in (7,8);

select nazwa from zasob where month(datapozyskania) in (7,8);

#zadanie 3.2

select nazwa from zasob where rodzaj is not null order by waga asc;

#zadanie 3.3

select data_Ur , nazwa from krestura order by data_ur asc limit 5;

select data_Ur , nazwa from krestura order by data_ur asc limit 5,3;

#Zadanie 4.1

SELECT rodzaj from kreatura;
SELECT DISTINCT rodzaj from kreatura;
SELECT DISTINCT (rodzaj) from kreatura;



metoda concat(kolumna , 'tekst' , funkcja())

select concat('Ala' , ' ' ,'ma' ,' ', 'kota');

select concat('Zasob ' , nazwa , 'zostal pozyskany w miesiacu o numerze',month(datapozyskania)) from zasob;
select concat('Zasob ' , nazwa , 'zostal pozyskany w miesiacu o numerze',month(datapozyskania)) as tekst from zasob;

select concat('w postaci :' , nazwa ,'-', rodzaj) from kreatura WHERE rodzaj LIKE 'wi%';
#złącza łancuchy znaków w jeden łańcuch 

#zadanie 4.2

select concat('w postaci :' , nazwa ,'-', rodzaj) from kreatura WHERE rodzaj LIKE 'wi%';

#zadanie 4.3

select concat('calkowita waga: ',ilosc*waga) from zasob WHERE dataPozyskania BETWEEN '2000-01-01'  AND '2007-12-31';

#zadanie 5.1

select concat('jedzenie netto: ', waga*0.70 , ' odpady: ' , waga*0.30) from zasob WHERE rodzaj='jedzenie';

#zadanie 5.2
select * from zasob WHERE rodzaj IS NULL;

#zadanie 5.3
SELECT DISTINCT rodzaj from zasob  WHERE nazwa LIKE 'Ba%' or nazwa LIKE '%os';
