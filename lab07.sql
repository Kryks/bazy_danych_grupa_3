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


#lab07
#zad1.2
select * from kreatura k
left join uczestnicy u on k.idKreatury=u.id_uczestnika
where u.id_uczestnika is null;

select distinct id_uczestnika from uczestnicy;

select nazwa from kreatura where idKreatury not in
 (select distinct id_uczestnika from uczestnicy);
 
 
select u.id_uczestnika,k.idKreatury from uczestnicy u 
right join kreatura k on u.id_uczestnika=k.idKreatury
where u.id_uczestnika is null;

#zad1.3
select w.nazwa,sum(e.ilosc) from wyprawa w
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on u.id_uczestnika=e.idKreatury
group by w.id_wyprawy;

select w.nazwa,sum(e.ilosc) , group_concat(z.nazwa,'->',e.ilosc) from wyprawa w
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on u.id_uczestnika=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
group by w.id_wyprawy;

select w.nazwa,sum(e.ilosc) , group_concat(z.nazwa,'->',e.ilosc) from wyprawa w
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on u.id_uczestnika=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
group by w.id_wyprawy,z.nazwa;

#zad2.1

select w.nazwa,count(u.id_uczestnika),group_concat(k.nazwa) from wyprawa w
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join kreatura k on u.id_uczestnika=k.idKreatury
group by w.id_wyprawy;

#zad2.2
select kolejnosc,data_rozpoczecia,s.nazwa,w.kierownik,k.nazwa from etapy_wyprawy e
inner join wyprawa w on e.idWyprawy=w.id_wyprawy
inner join sektor s on e.sektor=s.id_sektora
inner join kreatura k on w.kierownik=k.idKreatury
group by e.idEtapu
order by data_rozpoczecia , kolejnosc;

#3.1
select s.nazwa ,
if(count(ew.sektor) is null,0,count(ew.sektor))
from sektor s
left join etapy_wyprawy ew on s.id_sektora=ew.sektor
group by s.id_sektora;
#4.1
select w.nazwa,sum(length(dziennik)) as liczenie from etapy_wyprawy e
inner join wyprawa w on e.idWyprawy=w.id_wyprawy
inner join sektor s on e.sektor=s.id_sektora
group by w.id_wyprawy
having sum(length(dziennik))<400;

select w.nazwa,sum(length(dziennik)) as liczenie from etapy_wyprawy e
inner join wyprawa w on e.idWyprawy=w.id_wyprawy
inner join sektor s on e.sektor=s.id_sektora
group by w.id_wyprawy
having liczenie<400;



