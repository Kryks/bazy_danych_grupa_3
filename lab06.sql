#lab 06

#zadanie 1.1
SELECT avg(waga) from kreatura where rodzaj='wiking';

#zadanie 1.2
SELECT rodzaj,AVG(waga),count(rodzaj) from kreatura GROUP BY rodzaj;
#zadanie 1.3
select rodzaj,avg((1700-Year(dataUr))) as wiek from kreatura group by rodzaj;
#zadanie 2.1
select count(waga),rodzaj from zasob group by rodzaj;

#zadanie 2.2
select rodzaj,avg(waga) from kreatura where avg(waga)>50 group by rodzaj; 

nie zadziała to to sie dzieje przed tym zanim policzy ta srednia juz chce suzkac jakby
where jakby wczesniej dziala



select nazwa,avg(waga) 
from zasob where ilosc>=4
group by nazwa having avg (waga)>10;

#zadanie 2.3


select rodzaj, count(distinct nazwa) 
from zasob
group by rodzaj having min(ilosc) > 1;

#zadanie 3

# złączanie wewnętrzne
select * from kreatura k, ekwipunek e
where k.idKreatury=e.idKreatury;

# to samo ale używając INNER JOIN
select * from kreatura k
INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury;

#zadanie 3.1
select nazwa,count(ilosc) from kreatura k 
INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury
GROUP BY nazwa;

#zadanie 3.2
select k.nazwa,z.nazwa from kreatura k 
INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury
INNER JOIN zasob z ON e.idZasobu=z.idZasobu;


#left join
select k.nazwa, k.idKreatury ,e.idKreatury from kreatura k 
LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury

czasami po prawej moga być nule

#left join
select k.nazwa, k.idKreatury ,e.idKreatury from kreatura k 
LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury
where e.idKreatury is NULL;
