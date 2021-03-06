--4. Implementarea tabelelor

create table locatie(id_locatie number(5) primary key, 
denumire varchar2(30) not null unique, oras varchar2 (20) not null,
adresa varchar2(30) not null unique);


create table concert(id_concert number(5) primary key, nume varchar2(30) not null,
locatie number(5) references locatie(id_locatie) not null, numar_bilete number(5),
data_inceput date, ora_inceput number(3), durata number(5), buget number(7));


create table spectator(id_spectator number(5) primary key, nume varchar2(15) not null,
prenume varchar2(30) not null, data_nasterii date not null, mail varchar2(30) not null unique);


create table bilet(id_bilet number(5) primary key, id_concert number(5) references concert(id_concert) not null,
id_spectator number(5) references spectator(id_spectator), pret number(5), loc number(5));


create table sponsor(id_sponsor number(5) primary key, denumire varchar2(30),
sediu_principal number(5) references locatie(id_locatie) unique,
telefon varchar2(15) not null unique, mail varchar2(30) unique, suma_investitie number(9));


create table gen(id_gen number(5) primary key, denumire varchar2(30) not null unique, fani number(5));


create table formatie(id_formatie number(5)primary key, denumire varchar2(20) not null,
numar_membri number(3), id_gen number(5) references gen(id_gen), pret number(7));


create table membru(id_membru number(5) primary key, nume varchar2(20) not null, 
prenurchme vaar2(30) not null, salariu number(7),
id_formatie number(5) references formatie(id_formatie),
instrument varchar2(20), specializare varchar2(20));


create table aparatura(id_aparatura number(5) primary key, denumire varchar2(30),
id_tehnician number(5) references membru(id_membru));


create table contract (id_contract number(5) primary key, id_sponsor number(5) references sponsor(id_sponsor),
id_concert number(5) references concert(id_concert), id_formatie number(5) references formatie(id_formatie),
suma_concert number(7), suma_formatie number(7), data_formatie date);


-----


--5. Implementarea tabelelor

insert into locatie values(1, 'The New Age', 'Bucuresti', 'Str. N. Iorga, Nr. 30');
insert into locatie values(2, 'Rockoteca', 'Cluj', 'Str. Primaverii, Nr. 12');
insert into locatie values(3, 'Coca-Cola', 'Bucuresti', 'Str. Eroilor, Nr. 51');
insert into locatie values(4, 'Nokia', 'Timisoara', 'Bd. M. Eminescu, Nr. 31');
insert into locatie values(5, 'Cluj Arena', 'Cluj', 'Str. Progresului, Nr. 72');


insert into concert values(1, 'Cargo 30', 1, 150, to_date('01-01-2023', 'dd-mm-yyyy'), 20, 180, 2000);
insert into concert values(2, 'Trooper IMT', 1, 250, to_date('05-02-2023', 'dd-mm-yyyy'), 18, 120, 900);
insert into concert values(3, 'Metallica', 5, 5000, to_date('17-01-2023', 'dd-mm-yyyy'), 18, 240, 20000);
insert into concert values(4, 'Fara Zahar acustic', 2, 50, to_date('01-01-2023', 'dd-mm-yyyy'), 19, 60, 500);
insert into concert values(5, 'Holograf', 2, 300, to_date('07-03-2018', 'dd-mm-yyyy'), 15, 150, 450);


insert into spectator values(1, 'Avram', 'Marius-Ionut', to_date('06-01-2000', 'dd-mm-yyyy'), 'avrammarius@gmail.com');
insert into spectator values(2, 'Bot', 'Catalin', to_date('11-11-2011', 'dd-mm-yyyy'), 'cbot@gmail.com');
insert into spectator values(3, 'Tamas', 'Miruna', to_date('08-10-2003', 'dd-mm-yyyy'), 'tmiruna@yahoo.com');
insert into spectator values(4, 'Matei', 'Miruna',to_date('01-02-2008', 'dd-mm-yyyy'), ' mirunamatei@gmail.com');
insert into spectator values(5, 'Popescu', 'Matei', to_date('03-04-1998', 'dd-mm-yyyy'), 'mateipop@yahoo.com');


insert into bilet values(1, 1, 1, 100, 32);
insert into bilet values(2, 1, 1, 100, 33);
insert into bilet values(3, 4, 3, 50, 64);
insert into bilet values(4, 2, 5, 70, 12);
insert into bilet values(5, 2, 2, 60, 22);
insert into bilet values(6, 3, 1, 40, 15);
insert into bilet values(7, 1, 3, 65, 34);
insert into bilet values(8, 5, 3, 90, 55);
insert into bilet values(9, 1, 1, 85, 73);
insert into bilet values(10, 1, 2, 70, 19);


insert into sponsor values(1, 'One line', null , '0711111111', 'one@line.com', 2000);
insert into sponsor values(2, 'Coca-Cola Romania', 3 , '0714512111', 'coca@lcola.com', 300000);
insert into sponsor values(3, 'Nokia Romania', 4 , '0714145291', 'nokia@lconctact.ro', 150000);
insert into sponsor values(4, 'Small business', null , '0700011135', null, 1500);
insert into sponsor values(5, 'Rockoteca', 2 , '071461421451', null, 4000);


insert into gen values(1, 'hip hop', 150);
insert into gen values(2, 'rock', 200);
insert into gen values(3, 'blues', 75);
insert into gen values(4, 'dance', 100);
insert into gen values(5, 'jazz', 120);
insert into gen values(6, 'country', 100);


insert into formatie values(1, 'Trooper', 2, 1, 2500);
insert into formatie values(2, 'Metallica', 4, 2, 500000);
insert into formatie values(3, 'Holograf', 3, 3, 4000);
insert into formatie values(4, 'Delia', 1, 4, 18000);
insert into formatie values(5, 'Fara zahar', 2, 5, 1000);
insert into formatie values(6, 'Cargo', 3, 2, 6500);


insert into membru values(1, 'Costache', 'Alexandru', 3000, null, null, 'amplificatoare');
insert into membru values(2, 'Pop', 'Marius', 2500, null, null, 'amplificatoare');
insert into membru values(3, 'Enache', 'Alexandru', 2700, null, null, 'bass');
insert into membru values(4, 'Alexandru', 'Costel', 3100, null, null, 'monitoare');
insert into membru values(5, 'Costache', 'Andrei', 3200, null, null, 'lumini');
insert into membru values(6, 'Arghire', 'Ionut', 1900, null, null, 'microfoane');
insert into membru values(7, 'Dinca', 'Alin', 5000, 1, 'vocalist', null);
insert into membru values(8, 'Dinca', 'Paul', 4800, 1, 'chitarist', null);
insert into membru values(9, 'Hetfield', 'James', 500000, 2, 'vocalist', null);
insert into membru values(10, 'Hammett', 'Kirk', 500000, 2, 'chitarist', null);
insert into membru values(11, 'Trujilo', 'James', 500000, 2, 'basist', null);
insert into membru values(12, 'Ulrich', 'Lars', 500000, 2, 'tobosar', null);
insert into membru values(13, 'Bitman', 'Dan', 6000, 3, 'vocalist', null);
insert into membru values(14, 'Bitman', 'Ionut', 6000, 3, 'chitarist', null);
insert into membru values(15, 'Vadin', 'Dan', 6000, 3, 'tobosar', null);
insert into membru values(16, 'Matache', 'Delia', 7000, 4, 'vocalist', null);
insert into membru values(17, 'Burlacianu', 'Bogdan', 4000, 5, 'vocalist', null);
insert into membru values(18, 'Dumitras', 'Bogdan', 4000, 5, 'vocalist', null);
insert into membru values(19, 'Maruta', 'Andra', null, null, null, null);
insert into membru values(20, 'Igrisan', 'Adiran', 6000, 6, 'vocalist', null);
insert into membru values(21, 'Barar', 'Adiran', 6000, 6, 'chitarist', null);
insert into membru values(22, 'Pavel', 'Marcel', 6000, 6, 'tobosar', null);


insert into aparatura values(1, 'amplificatoare', 1);
insert into aparatura values(2, 'bass', 3);
insert into aparatura values(3, 'monitoare', 4);
insert into aparatura values(4, 'lumini', 5);
insert into aparatura values(5, 'microfoane', 6);


insert into contract values(1, 1, 1, 1, 200, 100, to_date('01-01-2020', 'dd-mm-yyyy'));
insert into contract values(2, 2, 1, 2, 300, 150, to_date('01-01-2020', 'dd-mm-yyyy'));
insert into contract values(3, 1, 2, 1, 200, 100, to_date('05-02-2020', 'dd-mm-yyyy'));
insert into contract values(4, 2, 3, 4, 2000, 1500, to_date('01-01-2020', 'dd-mm-yyyy'));
insert into contract values(5, 3, 1, 2, 5000, 1000, to_date('01-01-2020', 'dd-mm-yyyy'));
insert into contract values(6, 4, 1, 1, 200, 100, to_date('01-01-2020', 'dd-mm-yyyy'));
insert into contract values(7, 2, 3, 1, 900, 1000, to_date('01-01-2021', 'dd-mm-yyyy'));
insert into contract values(8, null, 5, 5, null, null, to_date('01-01-2020', 'dd-mm-yyyy'));
insert into contract values(9, 3, 3, 2, 2000, 1500, to_date('08-10-2020', 'dd-mm-yyyy'));
insert into contract values(10, 2, 4, 4, 5000, 1000, to_date('01-01-2020', 'dd-mm-yyyy'));


-----


--6
/* Pentru un concert cu id-ul citit de la tastatura, sa se memoreze intr-o colectie id-urile biletelor cumparate de la concertul respectiv, 
iar in alta colectie indexul tuturor artistilor/formatiilor care canta la concertul respectiv. Rezolvarea va fi cuprins-o intr-o procedura stocata.*/

CREATE OR REPLACE TYPE vector_idbilete IS VARRAY(20) OF NUMBER;
--crearea primei colectii, de tip vector
/
CREATE OR REPLACE PROCEDURE exercitiul6
--declararea procedurii     
(v_idcitit concert.id_concert%TYPE)
--parametri procedura
IS
vector_bilete vector_idbilete:= vector_idbilete();
--variabila de tip de date vector_idbilete
TYPE tablouindexat_idformatii IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
--crearea celei de a doua colectii, de tip tablou indexat
tablou_formatii tablouindexat_idformatii;
--variabila

BEGIN

--conditie folosita cu ajutorul blocului IF
IF(v_idcitit>5)
  THEN DBMS_OUTPUT.PUT_LINE('Nu exista concertul cu acest ID-ul '|| v_idcitit);
  --afisare pe linie noua cu DBMS_OUTPUT.PUT.LINE
ELSE
DBMS_OUTPUT.PUT_LINE('Pentru concertul cu ID-ul ' ||v_idcitit);

SELECT DISTINCT id_bilet
BULK COLLECT INTO vector_bilete
--memoram toate valorile gasite de SELECT in vector_bilete cu BULK COLLECT
FROM bilet
WHERE id_concert=v_idcitit;
--conditie

IF vector_bilete.count=0
--functia count este predefinita pentru colectii si afiseaza numarul de elemente memorate in colectie
  THEN DBMS_OUTPUT.PUT_LINE('Nu s-au inregistrat id-uri de bilete.');
ELSE
    DBMS_OUTPUT.PUT_LINE('ID-urile biletelor sunt:');
    --instructiune repetitiva cu numar cunoscut de pasi; FOR
    FOR i IN vector_bilete.first..vector_bilete.last
     LOOP
       DBMS_OUTPUT.PUT(vector_bilete(i));
       DBMS_OUTPUT.PUT(' ');
       --afisare pe linia curenta cu DBMS_OUTPUT.PUT
     END LOOP;
     DBMS_OUTPUT.NEW_LINE;
     --creare linie noua de afisare
END IF;  

SELECT DISTINCT id_formatie
BULK COLLECT INTO tablou_formatii
FROM contract
WHERE id_concert=v_idcitit;

IF tablou_formatii.count=0
  THEN DBMS_OUTPUT.PUT_LINE('Nu s-au inregistrat id-uri de formatii.');
ELSE
      
  DBMS_OUTPUT.PUT_LINE('ID-urile formatiilor sunt:');
  FOR i IN tablou_formatii.first..tablou_formatii.last
     LOOP
       DBMS_OUTPUT.PUT(tablou_formatii(i));
       DBMS_OUTPUT.PUT(' ');
     END LOOP;
  DBMS_OUTPUT.NEW_LINE;
END IF;   

END IF;
END exercitiul6;
/

DECLARE
id concert.id_concert%TYPE := &p_id;
--citire de la tastatura cu &
BEGIN
exercitiul13.exercitiul6(id);
END;
/


-----


--7
/*Pentru un id de concert dat de la tastatura, sa se afiseze 
ID-ul si pretul tuturor biletelor de la concertul respectiv. 
Rezolvarea se va face cu o procedura stocata*/

CREATE OR REPLACE PROCEDURE exercitiul7 (v_idcitit concert.id_concert% TYPE)
--creare procedura
IS
pret_bilet bilet.pret%TYPE;
--variabila cu tipul unei coloane dintr-un tabel specificate
id_concert_bilet bilet.id_concert%TYPE;
--variabila cu tipul unei coloane dintr-un tabel specificate

CURSOR cursor_bilete
IS
 SELECT id_bilet, pret
 FROM bilet
 WHERE v_idcitit=id_concert;
--declarare cursor
BEGIN
IF (v_idcitit>5)
   THEN DBMS_OUTPUT.PUT_LINE(' Nu exista concert cu ID-ul '||v_idcitit);
ELSE

DBMS_OUTPUT.PUT_LINE('Pentru concertul cu ID-ul ' ||v_idcitit||' au fost achizitionate momentan biletele: ');
OPEN cursor_bilete;
--deschidere cursor
  LOOP
    FETCH cursor_bilete
    --selectarea datelor din cursor pentru iteratia curenta
    INTO id_concert_bilet, pret_bilet;
  EXIT WHEN cursor_bilete%notfound;
  --conditie de iesire din cursor; cand nu mai exista iteratii
  DBMS_OUTPUT.PUT_LINE('Biletul cu ID-ul ' ||id_concert_bilet||' a fost achizitionat cu pretul de '||pret_bilet);
  END LOOP;
CLOSE cursor_bilete;
--inchidere cursor
END IF;
end exercitiul7;
/

DECLARE
id concert.id_concert%TYPE :=&p_id;

BEGIN
exercitiul13.exercitiul7(id);
END;
/


-----


--8
/*Sa se creeze un subprogram de tip functie stocata care sa numere toate concertele unice
unde exista minim o formatie/un artist care canta un gen CU ID-ul dat de la tastatura. */
--drop function exercitiul8;
CREATE OR REPLACE FUNCTION exercitiul8 (v_idcitit formatie.id_formatie%TYPE)
--creare functie
RETURN NUMBER IS
--tipul de data pe care il returneaza functia
   v_id formatie.id_formatie%TYPE;
   --variabila cu tipul unei coloane dintr-un tabel specificate
   numar_concerte NUMBER;
   --variabila cu tip de date specificat
--declarare functie
BEGIN
   SELECT id_formatie
   INTO v_id
   FROM formatie
   WHERE id_formatie=v_idcitit;
   --conditie
   SELECT COUNT (DISTINCT c.id_concert)
   --se numara doar id-urile distincte
   INTO numar_concerte
   --unde se memoreaza rezultatul din SELECT
   FROM contract c
   WHERE c.id_formatie IN
         (SELECT f.id_formatie
          FROM formatie f
          WHERE f.id_gen IN
                (SELECT g.id_gen
                 FROM gen g
                 WHERE g.id_gen=v_idcitit));
  --selectare prin where-uri imbricate
  RETURN numar_concerte;
  --valoarea returnata de functie
   EXCEPTION 
       WHEN  NO_DATA_FOUND
          THEN RAISE_APPLICATION_ERROR(-20001, 'Nu exista gen cu ID-ul '||v_idcitit);
       WHEN OTHERS 
          THEN RAISE_APPLICATION_ERROR(-20002,'Eroare nespecificata.');
   --exceptii predefinite
END exercitiul8;
/

DECLARE
id concert.id_concert%TYPE :=&p_id;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Genul cu ID-ul ' ||id|| ' este cantat la '||exercitiul13.exercitiul8(id)||' concerte diferite');
END;
/
   

-----


--9
/*Sa se afiseze o singura toate datele, in afara de mail, ale spectatorilor 
care participa la cel putin un concert unde exista o formatie care canta un gen
cu un numar de fani este egal cu numarul specificat de utilizator de la tastatura.
Aceasta problema se rezolva cu o procedura stocata.*/

CREATE OR REPLACE PROCEDURE exercitiul9 (v_nrfani gen.fani%TYPE)
--declarare procedura (si parametri)
IS
v_nf gen.fani%TYPE;
v_idspectator spectator.id_spectator%TYPE;
v_nume spectator.nume%TYPE;
v_prenume spectator.prenume%TYPE;
v_datan spectator.data_nasterii%TYPE;
--variabile locale

CURSOR cursor_spectatori
IS
SELECT DISTINCT s.id_spectator, s.nume, s.prenume, s.data_nasterii
INTO v_idspectator, v_nume, v_prenume, v_datan
FROM spectator s JOIN bilet b ON (b.id_spectator=s.id_spectator)
     JOIN contract c ON (c.id_concert=b.id_concert)
          JOIN formatie f ON (f.id_formatie=c.id_formatie)
               JOIN gen g ON (g.id_gen=f.id_gen)
--selectare prin join-uri imbricate
WHERE g.fani=v_nrfani
--conditie
ORDER BY s.data_nasterii;
--criteriu de ordonare

BEGIN

SELECT fani
INTO v_nf
FROM gen
WHERE fani=v_nrfani;

OPEN cursor_spectatori;
DBMS_OUTPUT.PUT_LINE('Pentru genurile cu ' ||v_nrfani||' fani au venit la concert spectatori cu datele: ');
  LOOP
    FETCH cursor_spectatori
    INTO v_idspectator, v_nume, v_prenume, v_datan;
  EXIT WHEN cursor_spectatori%notfound;
  DBMS_OUTPUT.PUT_LINE('ID-ul spectatorului '||v_idspectator||' numit '||v_nume|| ' '||v_prenume||' nascut in data de'||v_datan);
  END LOOP;
  EXCEPTION 
   WHEN NO_DATA_FOUND 
      THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista gen cu numarul de fani '||v_nrfani); 
   WHEN TOO_MANY_ROWS 
      THEN RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe genuri cu numarul de fani '||v_nrfani); 
   WHEN OTHERS 
      THEN RAISE_APPLICATION_ERROR(-20002,'Eroare nespecificata');
   --erori predefinite
CLOSE cursor_spectatori;

END exercitiul9;
/

DECLARE
nrfani NUMBER := &p_nr;
BEGIN
exercitiul9(nrfani);
END;
/



-----


--10
/*Trigger la nivel de comanda
  Sa se creeze un trigger care nu permite inserarea unor noi linii
  in tabelul 'aparatura' intre 5-10 al unei luni.*/

CREATE OR REPLACE TRIGGER exercitiul10
--declare trigger
   BEFORE INSERT ON aparatura
   --tip de trigger LMD deoarece foloseste cel putin una dintre INSERT, UPDATE, DELETE
BEGIN
  IF (TO_CHAR(SYSDATE,'DD'))  BETWEEN 5 AND 10
  --triggerul LMD este la nivel de comanda 
  THEN RAISE_APPLICATION_ERROR(-20001, 'Nu se fac angajari pentru tehnicieni in zilele de 5-10 ale lunii');
  --eroare
  END IF;
END;
/

INSERT into aparatura values (6, 'lumini', 2);
/
--drop trigger exercitiul10;
--stergerea triggerului


-----


--11
/*Trigger la nivel de linie
Sa se creeze  trigger care nu permite modificarea pretului niciunui bilet 
daca exista cel putin un bilet cu pretrul <=50.*/

CREATE OR REPLACE TRIGGER exercitiul11 
--declarare trigger
   BEFORE UPDATE ON bilet
   --tip de trigger LMD deoarece foloseste cel putin una dintre INSERT, UPDATE, DELETE
   FOR EACH ROW

BEGIN
   IF  (:OLD.pret <=50)
       --selectam valoarea intiala cu :OLD.coloana
       THEN RAISE_APPLICATION_ERROR(-20001, 'Pretul acestui bilet este deja la valoarea minima.');
       --eroare
   END IF;
END;
/

UPDATE bilet
SET pret=pret*0.75;
/


-----


--12
/*Trigger LDD
Sa se folosesca trigger pentru a afisa un mesaj de eroare 
in cazul in care se incearca modificarea oricarei tabele.*/

CREATE OR REPLACE TRIGGER exercitiul12
--declarare trigger
   BEFORE ALTER ON SCHEMA
   -- trigger de tip LDD deoarece foloseste cel putin una dintre ALTER, CREATE, DROP
BEGIN
   RAISE_APPLICATION_ERROR(-20001, ' Nu se poate modifica momentan tabelul din baza de date, deoarece exista riscul de a isi pierde coerenta');
   --eroare
END;
/
alter table aparatura
add coloana_random varchar2(5);
/
