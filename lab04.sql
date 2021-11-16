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



e)

CREATE TABLE zwierz
(id int auto_increment primary key, 
nazwa VARCHAR(50),
wiek INT);

f)


INSERT INTO zwierz
SELECT id_postaci , nazwa, wiek FROM postac
where  rodzaj='wonsz' or rodzaj='ptak';
