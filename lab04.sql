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
