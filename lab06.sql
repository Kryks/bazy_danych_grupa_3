#lab 06

#zadanie 1.1
SELECT avg(waga) from kreatura where rodzaj='wiking';

#zadanie 1.2

SELECT rodzaj,AVG(waga) from kreatura GROUP BY rodzaj;

#zadanie 1.3

select (1700-Year(dataUr)) as wiek from kreatura;
#zadanie 1.4
