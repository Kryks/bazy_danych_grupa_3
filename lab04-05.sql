#LAB04
# zadanie 1.1

 create table postac
 ( id_postaci int auto_increment primary key, 
 nazwa varchar (100), 
 rodzaj enum('wiking','ptak','kobieta'), 
 data_ur date, wiek int unsigned);

# zadanie 1.2
INSERT INTO postac VALUES(default, 'Bjorn', 'wiking','2001-02-01' ,35);
INSERT INTO postac VALUES('Drozd', 'ptak','2005-02-01' ,5);
INSERT INTO postac(nazwa,rodzaj, data_ur,wiek) VALUES('Tesciowa','kobieta','2003-05-02', 18);

# zadanie 1.3
UPDATE postac SET wiek=88 WHERE nazwa='Tesciowa';
 
#zadanie 2.1

 create table walizka
 ( id_walizki int auto_increment primary key, 
 pojemnosc int unsigned, 
 kolor enum('rozowy','czerwony','teczowy','zolty'), 
 id_wlascicela int, FOREIGN KEY (id_wlascicela) REFERENCES postac(id_postaci)ON DELETE CASCADE);

#zadanie 2.2

ALTER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';

#zadanie 2.3

INSERT INTO  walizka(pojemnosc, id_wlascicela) VALUES
    (20,  1),
    ( 10, 3);
	
# zadanie 3.1
create table izba
 (adres_budynku varchar(100) , 
nazwa_izby varchar(100) , 
metraz int unsigned,
 wlasciciel int , FOREIGN KEY (wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL,
 PRIMARY KEY(adres_budynku,nazwa_izby));
 
# zadanie 3.2

ALTER TABLE izba ADD COLUMN kolor_izby varchar(100) DEFAULT 'czarny' AFTER metraz;

# zadanie 3.3
INSERT INTO  izba(adres_budynku,nazwa_izby,metraz,wlasciciel) VALUES
    ('kwiatowa14','spizarnia',30,  1);
	
# zadanie 4.1

create table przetwory
 (id_przetworu int auto_increment primary key, 
data_ur INT(4) DEFAULT 1654, 
id_wykonawcy int,
zawartosc varchar(255),
dodatek varchar(200) DEFAULT 'papryczka chilli',
id_konsumenta int,
 FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci) ,
 FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci));
 
 #zadanie 4.2
 INSERT INTO  przetwory(id_wykonawcy,zawartosc,id_konsumenta) VALUES
    (1,'bigos z papryczka chilli',3);
    
 #zadanie 5.1
INSERT INTO postac(nazwa,rodzaj, data_ur,wiek) VALUES
('Bigosobrody','wiking','1652-05-02', 31),
('Lugos','wiking','1650-02-02', 32),
('Udalryk','wiking','1640-01-02', 38),
('Ragnar','wiking','1642-03-02', 32),
('Bran','wiking','1648-08-02', 36)
;

#zadanie 5.2
CREATE TABLE statek
(nazwa_statku varchar(255) primary key, 
rodzaj_statku enum("duzy","sredni","maly"),
data_wodowania INT(4) DEFAULT 1654, 
max_ladownosc int unsigned);


#zadanie 5.3
INSERT INTO statek(nazwa_statku,rodzaj_statku,max_ladownosc) VALUES
('Maria','duzy',100),
('Ewa','sredni',50);

#zadanie 5.4
ALTER TABLE postac ADD COLUMN funkcja varchar(50);

#zadanie 5.5
UPDATE postac SET funkcja='kapitan' WHERE nazwa='Bjorn';

#zadanie 5.6
#krok1
ALTER TABLE postac ADD COLUMN nazwa_statku varchar(255);

#krok2
Alter table postac add FOREIGN KEY (nazwa_statku) REFERENCES statek(nazwa_statku);

#zadanie 5.7
UPDATE postac SET nazwa_statku='Maria' WHERE nazwa='Bigosobrody' OR nazwa='Lugos' OR nazwa='Udalryk' OR nazwa='Bjorn' OR nazwa='Bran';

UPDATE postac SET nazwa_statku='Ewa' WHERE nazwa='Tesciowa' OR nazwa='Ragnar' OR nazwa='Drozd';

#inny sposob

update postac set statek='Maria' where id_postaci in (1,2,3,4,5);

#zadanie 5.8
DELETE FROM izba WHERE nazwa_izby='spizarnia';

#zadanie 5.9
DROP TABLE izba;

#LAB 4

#zadanie 1.1

select * from postac where rodzaj='wiking' order by wiek desc limit 2;

delete from postac where wiek=36 or wiek=38;

#zadanie 1.2

ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_2;

ALTER TABLE postac MODIFY id_postaci INT;

ALTER TABLE postac DROP Primary key;

#zadanie 2.1

ALTER TABLE postac add column pesel char(11) primary key;

update postac set pe*sel=12345678901 + id_postaci

Alter table postac add primary key (pesel);

#zadanie 2.2
ALTER TABLE postac MODIFY  rodzaj enum('wiking','ptak','kobieta','syrena');

#zadanie 2.3
INSERT INTO postac(id_postaci,nazwa,rodzaj, data_ur,wiek,pesel) VALUES
(8,'Gertruda_Nieszczera','syrena','1648-05-02', 25,'12345678909');

#zadanie 3.1

select nazwa from postac where nazwa LIKE '%a%';

UPDATE postac SET nazwa_statku='Maria' WHERE nazwa LIKE '%a%';

#zadanie 3.2
UPDATE statek SET max_ladownosc * 0.7; WHERE data_wodowania >= '1601-01-01' and data_wodowania <= '1700-12-31';

#zadanie 3.3
#zadanie 3.3

SELECT * from postac WHERE wiek>1000;

#zadanie 4.1
1. Dodajemy nowy rodzaj postaci - wąż (raczej waz lub wonsz)
2. INSERT INTO ...

ALTER TABLE postac MODIFY  rodzaj enum('wiking','ptak','kobieta','syrena','wonsz');

INSERT INTO postac(id_postaci,nazwa,rodzaj, data_ur,wiek,pesel) VALUES
(9,'Loko','wonsz','1658-05-02', 15,'12345678910');

#zadanie 4.2
Sposób 1:
CREATE TABLE marynarz LIKE postac;
# tylko struktura, bez danych, odtwarza również klucz główny
INSERT INTO marynarz SELECT * FROM postac WHERE nazwa_statku is not NULL;

zrobiłem sposob 1

Sposób 2:
CREATE TABLE marynarz2 SELECT * FROM postac WHERE statek is not NULL;
# ale nie ma klucza głównego
ALTER TABLE marynarz2 ADD PRIMARY KEY(id_postaci);

#zadanie 4.3
c) opcjonalnie należy dodać PRIMARY KEY (jeżeli użyto sposobu nr 2)
i dodać klucze obce bez względu na wybrany sposób.

Alter table marynarz add FOREIGN KEY (nazwa_statku) REFERENCES statek(nazwa_statku);

#zadania 5
a)

UPDATE marynarz SET nazwa_statku=NULL WHERE nazwa_statku is not null;

b)
DELETE FROM postac where nazwa='Ragnar';

c) 

ALTER TABLE marynarz
DROP FOREIGN KEY marynarz_ibfk_1;


ALTER TABLE postac
DROP FOREIGN KEY postac_ibfk_1;

DELETE  FROM statek ;


d)

DROP TABLE statek;
sprawdzic czy działa


e)

CREATE TABLE zwierz
(id int auto_increment primary key, 
nazwa VARCHAR(50),
wiek INT);

f)


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
