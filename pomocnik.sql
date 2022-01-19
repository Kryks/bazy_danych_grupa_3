create table pracownik(
id int auto_increment primary key,
imie varchar(50) not null,
nazwisko varchar(100) not null,
data_urodzenia date ,
stanowski enum('sprzedawca','magazynier','ksiegowa')
);

insert into pracownik (imie , nazwisko , data_urodzenia,stanowski) VALUES 
('Maciek','szynka','2001-12-9','sprzedawca'),
('Krzysztof','ser','2001-12-9','magazynier'),
('Flet','wiejski','2001-12-9','ksiegowa');

select * from pracownik;

alter table pracownik rename column stanowski to stanowisko;

describe pracownik;

create table dzial(
id int auto_increment primary key,
nazwa varchar(255));


insert into dzial values
(1,'sprzedaz'),
(2,'ksiegowosc'),
(3,'magazyn');


alter table pracownik alter stanowisko set default ('sprzedawca');

describe pracownik;

alter table pracownik add column pensja float(5,2);

select * from pracownik;

update pracownik set pensja=999 where id in(1,2,3); 

alter table dzial rename column nazwa to nazwa_dzialu;
alter table dzial rename column id to id_dzialu;
alter table pracownik rename column id to id_pracownika;

Delete from pracownik where id_pracownika order by id_pracownika desc limit 1 ;

alter table pracownik add foreign key (dzial) references dzial(id_dzialu);

describe pracownik;

update pracownik set dzial=1 where id_pracownika=1; 
update pracownik set dzial=2 where id_pracownika=2; 

select * from pracownik;

select * from pracownik;

select * from dzial;

select * from pracownik p
inner join dzial d on p.dzial=d.id_dzialu;

select * from pracownik p
left  join dzial d on p.dzial=d.id_dzialu;

select * from pracownik p
right join dzial d on p.dzial=d.id_dzialu;

insert into pracownik (id_pracownika, imie,nazwisko,data_urodzenia,stanowisko,pensja) values
(3,'Michal','kefir','1999-02-03','magazynier',800);

use wikingowie;

show tables;

select  AVG(waga) from kreatura;

select rodzaj,AVG(waga) from kreatura
group by rodzaj;

select rodzaj,AVG(waga) from kreatura
where rodzaj='wiking';
