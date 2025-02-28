---Proiect Baza de date pentru o Biblioteca

--1)
drop table Categorii cascade constraints;
drop table Autori cascade constraints;
drop table Carti cascade constraints;
drop table Cititori cascade constraints;
drop table Imprumuturi cascade constraints;
drop table Rezervari cascade constraints;


create table Categorii
(ID_categorie number(3) constraint PK_categorie PRIMARY KEY,
denumire varchar2(30) not null);

create table Autori
(ID_autor number(3) constraint PK_autor PRIMARY KEY,
 nume varchar2(15) not null,
 prenume varchar2(15) not null,
 tara varchar2(30));

create table Carti
(cod_carte number(3)constraint PK_carte PRIMARY KEY,
 titlu varchar2(25) not null,
 autor varchar2(25) not null,
 an_publicare number(4),
 disponibilitate varchar2(20) constraint disponibilitate_CK check 
 (disponibilitate in ('Disponibil','Imprumutat')),
 ID_categorie number(3),
 constraint FK_carti1 FOREIGN KEY (ID_categorie) references Categorii(ID_categorie),
 ID_autor number(3),
 constraint FK_carti2 FOREIGN KEY (ID_autor) references Autori(ID_autor)
 );
 
 create table Cititori
(ID_cititor number(3) constraint PK_cititor PRIMARY KEY,
 nume varchar2(15) not null,
 prenume varchar2(15) not null,
 email varchar2(40) not null,
 telefon number(10));

 create table Imprumuturi 
(nr_imprumut number(3) constraint PK_imprumut PRIMARY KEY,
data_imprumut date not null,
data_returnare date not null,
cod_carte number(3),
constraint FK_imprumut1 FOREIGN KEY (cod_carte) references Carti(cod_carte),
ID_cititor number(3),
constraint FK_imprumut2 FOREIGN KEY (ID_cititor) references Cititori(ID_cititor));

 
create table Rezervari
(ID_rezervare number(3)constraint PK_rezervare PRIMARY KEY,
data_rezervare date not null,
data_expirare date not null,
ID_cititor number(3),
constraint FK_rezervari1 FOREIGN KEY (ID_cititor) references Cititori(ID_cititor),
cod_carte number(3),
constraint FK_rezervari2 FOREIGN KEY (cod_carte) references Carti(cod_carte)
);

alter table cititori 
add (varsta number(2));

alter table cititori
add constraint check_varsta CHECK(varsta>16 and varsta<99);

alter table carti
modify (titlu varchar2(40));

commit;
--2)
insert into Categorii (ID_categorie, denumire) values (1, 'Fictiune');
insert into Categorii (ID_categorie, denumire) values (2, 'Non-Fictiune');
insert into Categorii (ID_categorie, denumire) values (3, 'Stiintific');
insert into Categorii (ID_categorie, denumire) values (4, 'Istorie');
insert into Categorii (ID_categorie, denumire) values (5, 'Biografie');
insert into Categorii (ID_categorie, denumire) values (6, 'Arta');
insert into Categorii (ID_categorie, denumire) values (7, 'Tehnologie');
insert into Categorii (ID_categorie, denumire) values (8, 'Literatura Clasica');
insert into Categorii (ID_categorie, denumire) values (9, 'Poezie');
insert into Categorii (ID_categorie, denumire) values (10, 'Gastronomie');

select * from Categorii;

insert into Autori (ID_autor, nume, prenume, tara) values (1, 'Verne', 'Jules', 'Franta');
insert into Autori (ID_autor, nume, prenume, tara) values (2, 'Petrescu', 'Camil', 'Romania');
insert into Autori (ID_autor, nume, prenume, tara) values (3, 'Shakespeare', 'William', 'Marea Britanie');
insert into Autori (ID_autor, nume, prenume, tara) values (4, 'Dostoievski', 'Fyodor', 'Rusia');
insert into Autori (ID_autor, nume, prenume, tara) values (5, 'Plath', 'Sylvia', 'SUA');
insert into Autori (ID_autor, nume, prenume, tara) values (6, 'Austen', 'Jane', 'Marea Britanie');
insert into Autori (ID_autor, nume, prenume, tara) values (7, 'Camus', 'Albert', 'Franta');
insert into Autori (ID_autor, nume, prenume, tara) values (8, 'Durant', 'Will', 'SUA');
insert into Autori (ID_autor, nume, prenume, tara) values (9, 'McAfee', 'Andrew', 'SUA');
insert into Autori (ID_autor, nume, prenume, tara) values (10, 'Gombrich', 'E.H.', 'Marea Britanie');
insert into Autori (ID_autor, nume, prenume, tara) values (11, 'Isaacson', 'Walter', 'SUA');
insert into Autori (ID_autor, nume, prenume, tara) values (12, 'Hawking', 'Stephen', 'Marea Britanie');

select * from Autori;

insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (1, 'Ocolul Pamantului in 80 de zile', 'Jules Verne', 1873, 'Disponibil', 1, 1);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (2, 'Patul lui Procust', 'Camil Petrescu', 1933, 'Disponibil', 8, 2);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (3, 'Hamlet', 'William Shakespeare', 1601, 'Disponibil', 8, 3);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (4, 'Romeo ?i Julieta', 'William Shakespeare', 1597, 'Imprumutat', 9, 3);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (5, 'Crima ?i Pedeapsa', 'Fyodor Dostoievski', 1866, 'Disponibil', 8, 4);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (6, 'Clopotul de Sticl?', 'Sylvia Plath', 1963, 'Imprumutat', 5, 5);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (7, 'Ariel', 'Sylvia Plath', 1965, 'Imprumutat', 9, 5);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (8, 'Mandrie ?i Prejudecata', 'Jane Austen', 1813, 'Disponibil', 8, 6);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (9, 'Strainul', 'Albert Camus', 1942, 'Imprumutat', 8, 7);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (10, 'The Story of Civilization', 'Will Durant', 1935, 'Imprumutat', 4, 8);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (11, 'The Second Machine Age', 'Andrew McAfee', 2014, 'Imprumutat', 7, 9);
insert into Carti (cod_carte, titlu, autor, an_publicare, disponibilitate, ID_categorie, ID_autor)
values (12, 'O scurta istorie a timpului', 'Stephen Hawking', 1988, 'Imprumutat', 3, 12);

select * from Carti;

insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (1, 'Popescu', 'Ana', 'ana.popescu@example.com', 0723456789);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (2, 'Ionescu', 'Mihai', 'mihai.ionescu@example.com', 0745678123);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (3, 'Marinescu', 'Raluca', 'raluca.marinescu@example.com', 0734567890);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (4, 'Dumitru', 'Andrei', 'andrei.dumitru@example.com', 0756789123);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (5, 'Constantin', 'Elena', 'elena.constantin@example.com', 0721678945);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (6, 'George', 'Victor', 'victor.georgescu@example.com', 0732789456);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (7, 'Radulescu', 'Maria', 'maria.radulescu@example.com', 0743789123);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (8, 'Stan', 'Bogdan', 'bogdan.stan@example.com', 0765891234);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (9, 'Lungu', 'Ioana', 'ioana.lungu@example.com', 0774567891);
insert into Cititori (ID_cititor, nume, prenume, email, telefon)
values (10, 'Popa', 'Alexandru', 'alexandru.popa@example.com', 0789678123);

select * from Cititori;

insert into Imprumuturi (nr_imprumut, data_imprumut, data_returnare, cod_carte, ID_cititor)
values (1, TO_DATE('12.12.2024', 'DD.MM.YYYY'), TO_DATE('20.12.2024', 'DD.MM.YYYY'), 4, 6);

insert into Imprumuturi (nr_imprumut, data_imprumut, data_returnare, cod_carte, ID_cititor)
values (2, TO_DATE('02.12.2024', 'DD.MM.YYYY'), TO_DATE('18.12.2024', 'DD.MM.YYYY'), 6, 9);

insert into Imprumuturi (nr_imprumut, data_imprumut, data_returnare, cod_carte, ID_cititor)
values (3, TO_DATE('11.12.2024', 'DD.MM.YYYY'), TO_DATE('29.12.2024', 'DD.MM.YYYY'), 7, 1);

insert into Imprumuturi (nr_imprumut, data_imprumut, data_returnare, cod_carte, ID_cititor)
values (4, TO_DATE('13.12.2024', 'DD.MM.YYYY'), TO_DATE('20.12.2024', 'DD.MM.YYYY'), 9, 10);

insert into Imprumuturi (nr_imprumut, data_imprumut, data_returnare, cod_carte, ID_cititor)
values (5, TO_DATE('12.12.2024', 'DD.MM.YYYY'), TO_DATE('20.12.2024', 'DD.MM.YYYY'), 10, 5);

insert into Imprumuturi (nr_imprumut, data_imprumut, data_returnare, cod_carte, ID_cititor)
values (6, TO_DATE('12.12.2024', 'DD.MM.YYYY'), TO_DATE('20.12.2024', 'DD.MM.YYYY'), 11, 5);

insert into Imprumuturi (nr_imprumut, data_imprumut, data_returnare, cod_carte, ID_cititor)
values (7, TO_DATE('07.12.2024', 'DD.MM.YYYY'), TO_DATE('17.12.2024', 'DD.MM.YYYY'), 12, 7);

select * from Imprumuturi;

insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (1, TO_DATE('01.12.2024', 'DD.MM.YYYY'), TO_DATE('10.12.2024', 'DD.MM.YYYY'), 1, 1);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (2, TO_DATE('02.12.2024', 'DD.MM.YYYY'), TO_DATE('11.12.2024', 'DD.MM.YYYY'), 2, 2);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (3, TO_DATE('03.12.2024', 'DD.MM.YYYY'), TO_DATE('12.12.2024', 'DD.MM.YYYY'), 2, 3);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (4, TO_DATE('04.12.2024', 'DD.MM.YYYY'), TO_DATE('15.12.2024', 'DD.MM.YYYY'), 4, 4);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (5, TO_DATE('04.12.2024', 'DD.MM.YYYY'), TO_DATE('14.12.2024', 'DD.MM.YYYY'), 5, 5);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (6, TO_DATE('07.12.2024', 'DD.MM.YYYY'), TO_DATE('15.12.2024', 'DD.MM.YYYY'), 6, 5);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (7, TO_DATE('01.12.2024', 'DD.MM.YYYY'), TO_DATE('14.12.2024', 'DD.MM.YYYY'), 8, 1);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (8, TO_DATE('05.12.2024', 'DD.MM.YYYY'), TO_DATE('11.12.2024', 'DD.MM.YYYY'), 9, 9);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (9, TO_DATE('07.12.2024', 'DD.MM.YYYY'), TO_DATE('17.12.2024', 'DD.MM.YYYY'), 10, 10);
insert into Rezervari (ID_rezervare, data_rezervare, data_expirare, ID_cititor, cod_carte)
values (10, TO_DATE('09.12.2024', 'DD.MM.YYYY'), TO_DATE('13.12.2024', 'DD.MM.YYYY'), 3, 9);

select * from Rezervari;

update Cititori
set varsta=20
where ID_cititor<5;

select * from Cititori;

update Rezervari
set data_expirare=to_date('02.01.2025', 'DD.MM.YYYY')
where data_expirare>to_date('15.12.2024','DD.MM.YYYY');

select * from Rezervari;

update Imprumuturi 
set data_returnare=(select data_returnare from Imprumuturi where cod_carte=9)
where ID_cititor=5;

select * from Imprumuturi;

commit;

delete from Rezervari
where cod_carte=5;

delete from Imprumuturi
where ID_cititor=3;

delete from Rezervari;

rollback;


--3)SELECT
--Operatori de comparatie
---Afisarea titlului si a anului publicarii cartilor publicate inainte de anul 1990
select titlu, an_publicare 
from Carti
where an_publicare<1990;

---Afisarea numelui, prenumelui si a varstei cititorilor cu varsta cuprinsa intre 20-30 ani
select nume, prenume, varsta
from Cititori
where varsta between 20 and 35;



---Afisarea cartilor disponibile din categoria 'Literatura Clasica'
select titlu from Carti
where disponibilitate='Disponibil' 
and ID_categorie=(select ID_categorie from Categorii where denumire='Literatura Clasica');

---Afisarea rezervarilor(id rezervare, id cititor, data rezervare si expirare) care expira dupa 15.12.2024
select ID_rezervare,ID_cititor, data_rezervare, data_expirare
from Rezervari
where data_expirare>to_date('15.12.2024','DD.MM.YYYY');

---Afisarea nume, prenume cititori care nu au introdusa varsta
select nume, prenume from Cititori
where varsta is null;

--Join
---Inner Join intre carti si autori pentru a obtine titlurile cartilor si numele autorilor
select Carti.titlu, Autori.nume, Autori.prenume
from Carti
INNER JOIN Autori ON Carti.ID_autor=Autori.ID_autor;

---Left Join intre imprumuturi si cititori pentru a afisa toate imprumuturile si cititorii lor 
select Imprumuturi.nr_imprumut, Imprumuturi.data_imprumut, Cititori.nume, Cititori.prenume
from Imprumuturi
LEFT JOIN Cititori ON Imprumuturi.ID_cititor=Cititori.ID_cititor;

---Right Join intre carti si rezervari pentru a afisa rezervarile facute pentru fiecare carte(indiferent daca sunt facute sau nu rezervari pentru cartea respectiva)
select Carti.titlu, Rezervari.data_rezervare
from Carti
RIGHT JOIN Rezervari ON Carti.cod_carte=Rezervari.cod_carte;

---Inner Join intre Carti si Categorii pentru a afisa titlurile cartilor si categoriile din care fac parte
select Carti.titlu, Categorii.denumire
from Carti
INNER JOIN Categorii ON Carti.ID_categorie=Categorii.ID_categorie;

--Inner Join intre Autori si Carti pentru a afisa pe o coloana titlul cartii scrise de fiecare autor
select a.nume||' '||a.prenume||'a scris cartea: '||c.titlu
from Autori a, Carti c
where c.ID_autor=a.ID_autor;

--Functii de grup

--Count-nr cartilor disponibile in fiecare categorie
select c.ID_categorie, COUNT(*) as Total_Carti
from Carti c
where c.disponibilitate='Disponibil'
group by c.ID_categorie;

--SUM-totalul imprumuturilor facute de fiecare cititor (1 adauga 1 pt fiecare imprumut si ret suma)
select i.ID_cititor, SUM(1) as Total_Imprumuturi
from Imprumuturi i
group by i.ID_cititor;

--AVG - varsta medie a cititorilor
select AVG(c.varsta) as Varsta_Medie
from Cititori c;

--MAX - cel mai recent an de publicare
select MAX(c.an_publicare) as an_publicare_max
from Carti c;

--MIN - afiseaza cea mai veche carte disponibila
select MIN(c.an_publicare) as an_publicare_min
from Carti c
where c.disponibilitate='Disponibil';

--Functii numerice, de tip caracter, pt data si timp

--Rotunjirea datei de returnare in functie de luna
select nr_imprumut, data_returnare, 
ROUND(data_returnare, 'MM') as luna_returnare
from Imprumuturi;

--Obtinerea nr de zile ramase pentru fiecare imprumut
select nr_imprumut, data_imprumut, 
SYSDATE - data_imprumut as zile_ramase
from Imprumuturi;

--Eliminarea partii fractionare pentru zilele ramase calculate anterior
select TRUNC( SYSDATE - data_imprumut)
as zile_ramase_intreg
from Imprumuturi;

--Concatenarea numelui si prenumelui cititorilor
select CONCAT(nume , prenume) as nume_cititori
from Cititori;

--Transformarea unei date intr-un sir de caractere
select TO_CHAR(data_imprumut, 'DD/MM/YYYY')
as data_imprumut_char
from Imprumuturi;

---Decode 
---Returnarea unui mesaj in functie de statusul de disponibilitate al cartilor
select titlu,
DECODE(disponibilitate, 'Disponibil', 'Cartea poate fi imprumutata',
'Imprumutat', 'Cartea este deja imprumutata',
'Status necunoscut')
as Mesaj_Disponibilitate
from Carti;

---Afisarea statusului unui cititor in functie de nr de imprumuturi
select c.nume || ' ' || c.prenume as CITITOR,
DECODE(count(i.nr_imprumut), 
0, 'Nu a imprumutat carti',
1, 'Are un singur imprumut',
'Cititorul are mai multe imprumuturi') as nr_imprumuturi
from Cititori c
left join Imprumuturi i on c.ID_cititor=i.ID_cititor
group by c.nume, c.prenume;

--Case
--Clasificarea cartilor in functie de vechime
select titlu,
CASE 
when an_publicare<1990 then 'Carte veche'
when an_publicare between 1900 and 2000 then 'Carte moderna'
else 'Carte contemporana'
end as Vechime
from Carti;

---Clasificarea cititorilor in functie de varsta 
select nume as Cititor,
CASE
when varsta is null then 'Varsta Necunoscuta'
when varsta between 16 and 19 then 'Adolescent'
when varsta between 20 and 35 then 'Adult tanar'
when varsta between 35 and 60 then  'Adult'
else 'Alta categorie'

end as Categorii_varsta
from Cititori;

--Determinarea prioritatii unei rezervari in functie de nr de zile ramase pana la expirare
select ID_rezervare,
CASE 
when data_expirare - SYSDATE<=2 then 'Prioritate ridicata'
when data_expirare - SYSDATE between 3 and 7 then 'Prioritate medie'
else 'Prioritate scazuta'
end as Prioritate_rezervari
from Rezervari;

--Utilizarea operatorilor UNION, MINUS, INTERSECT 
--Lista cu toti cititorii care au imprumutat sau rezervat carti
select distinct ID_cititor
from Imprumuturi
union
select distinct ID_cititor
from Rezervari;

--Lista cu cartile care fac parte din categoria "Fictiune" sau "Biografie"
select titlu
from Carti where ID_categorie=1
UNION
select titlu
from Carti where ID_categorie=5;

--Lista cu persoanele care sunt si autori si cititori
select nume, prenume
from Autori
INTERSECT
select nume, prenume
from Cititori;

--Lista cu toate cartile care nu au fost imprumutate
select cod_carte
from Carti
MINUS
select distinct cod_carte
from Imprumuturi;

--Subcereri (cereri imbricate)
--Cititorii care au imprumutat carti din categoria "Fictiune"
select c.nume, c.prenume 
from Cititori c
where ID_cititor in 
(select ID_cititor from Imprumuturi 
where cod_carte in
(select cod_carte from Carti 
where ID_categorie =
(select ID_categorie from Categorii
where denumire='Biografie')));

--Categorii cu mai putin de 2 carti disponibile 
select Categorii.denumire as Categorie,
count(Carti.cod_carte) as TOTAL_CARTI
from Carti
inner join Categorii on Carti.ID_categorie=Categorii.ID_categorie
where disponibilitate = 'Disponibil'
group by Categorii.denumire
having count(Carti.cod_carte) < 2;

create v_carti_autori as
select c.cod_carte, c.titlu, a.nume as autor_nume, a.prenume as autor_prenume
from Carti c
join Autori a on c.ID_autor = a.ID_autor;

