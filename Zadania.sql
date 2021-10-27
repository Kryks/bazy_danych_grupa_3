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
(nazwa_statku int auto_increment primary key, 
rodzaj_statku enum(),
data_wodowania INT(4) DEFAULT 1654, 
zawartosc varchar(255),
dodatek varchar(200) DEFAULT 'papryczka chilli',
id_konsumenta int,
 FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci) ,
 FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci));

  
