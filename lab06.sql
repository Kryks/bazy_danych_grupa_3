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

#zadanie 3.3

#left join
select k.nazwa, k.idKreatury ,e.idKreatury from kreatura k 
LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury
where e.idKreatury is NULL;

# podzapytanie
select idKreatury from kreatura where idKreatury not in
(select distinct idKreatury from ekwipunek
where idKreatury is not NULL);


select * from kreatura k1, kreatura k2 
where k1.IdKreatury=k2.idKreatury;


#zad4.1




#zad4.2

select * from kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
where z.rodzaj='jedzenie' order by k.dataUr desc limit 5;


#zad4.3
select nazwa , idKreatury,nazwa,idKreatury from kreatura;

select k1.nazwa,k2.nazwa from kreatura k1
inner join kreatura k2 on k2.idKreatury-k1.idKreatury=5;


#zad5.1

select avg(e.ilosc*z.waga),sum(e.ilosc),k.rodzaj from kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
where k.rodzaj not in ('malpa','waz') and e.ilosc<30
group by k.rodzaj;

policzy przed sortowaniem  bo dalismy w where

select avg(e.ilosc*z.waga),sum(e.ilosc),k.rodzaj from kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
where k.rodzaj not in ('malpa','waz') 
group by k.rodzaj having sum(e.ilosc)<30;

policzy po sortowaniu bo w having mamy

#zad5.2
select * from kreatura k,
(select rodzaj ,min(dataUr) as min, max(dataUr) as max from kreatura
group by rodzaj) as pod
where k.dataUr=pod.min or k.dataUr=pod.max 
and k.rodzaj=pod.rodzaj;


