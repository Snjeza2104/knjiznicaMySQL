DROP DATABASE IF EXISTS knjiznica;
CREATE DATABASE IF NOT EXISTS knjiznica;

USE knjiznica;

CREATE TABLE autor(
	autorID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	prezime VARCHAR(25) NOT NULL,
	ime VARCHAR(25) NOT NULL
);

CREATE UNIQUE INDEX prezime_ime ON autor(prezime, ime);

CREATE TABLE izdavac(
	izdavacID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ime_izdavaca VARCHAR(25) NOT NULL,
	broj_telefona VARCHAR(15) NOT NULL,
	fax VARCHAR(15),
	email VARCHAR(35) NOT NULL
);

CREATE UNIQUE INDEX izdavaci ON izdavac(ime_izdavaca);

CREATE TABLE knjiga(
	knjigaID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	naslov VARCHAR(45) NOT NULL,
	izdavacID INT UNSIGNED NOT NULL,
	broj_stranica INT UNSIGNED NOT NULL,
	cijena INT NOT NULL,
	godina_izdanja VARCHAR(4) NOT NULL,
	CONSTRAINT izdaje FOREIGN KEY (izdavacID) REFERENCES izdavac(izdavacID)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE pisci(
	autorID INT UNSIGNED NOT NULL,
	knjigaID INT UNSIGNED NOT NULL,
	CONSTRAINT autorje FOREIGN KEY (autorID) REFERENCES autor(autorID)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT knjigaje FOREIGN KEY (knjigaID) REFERENCES knjiga(knjigaID)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (autorID, knjigaID)
);

CREATE TABLE posudjivac(
	posudjivacID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	prezime VARCHAR(20) NOT NULL,
	ime VARCHAR(20) NOT NULL,
	mobitel VARCHAR(11) NOT NULL,
	email VARCHAR(30) NOT NULL
);

CREATE UNIQUE INDEX prezime_ime2 ON posudjivac(prezime, ime);

CREATE TABLE posudio(
	posudjivacID INT UNSIGNED NOT NULL,
	knjigaID INT UNSIGNED NOT NULL,
	datum_posudbe DATE,
	datum_vracanja DATE,
	PRIMARY KEY (posudjivacID, knjigaID),
	CONSTRAINT posudioje FOREIGN KEY (posudjivacID) REFERENCES posudjivac(posudjivacID)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT knjigapos FOREIGN KEY (knjigaID) REFERENCES knjiga(knjigaID)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO autor(prezime, ime) VALUES
('Saleski','Franjo'),
('Rupnik', 'Marko Ivan'),
('Sion', 'Victor'),
('Philippe', 'Jacques'),
('Manney', 'Jim'),
('Hadjadj', 'Fabrice'),
('od Kriza', 'Ivan'),
('Stinissen', 'Wilfrid'),
('Albisetti', 'Valerio'),
('Barbaric', 'Slavko'),
('Rajter', 'Mirjana'),
('OS Brezovica', 'ucenici'),
('Soldi', 'Primo'),
('Dobraczynski', 'Jan'),
('Franjo', 'papa'),
('Lewis', 'Clive Staples'),
('Wojtyla', 'Karol'),
('Kheriaty', 'Aaron'),
('Cihak', 'John'),
('Martin', 'James'),
('Vujicic', 'Nick'),
('Cloud', 'Henry'),
('Townsend', 'John'),
('Jakumetovic', 'Domagoj'),
('Jakumetovic', 'Krešimir'),
('Susac', 'Kristina'),
('de Jesus Sacramentado', 'Crisogono'),
('Balasko', 'Josip'),
('Kriskovic', 'Zrinka'),
('Dean', 'Zdravka'),
('Mijosevic', 'Snjezana');

INSERT INTO izdavac(ime_izdavaca, broj_telefona, fax, email) VALUES
('Verbum', '021/340260', '021/340270', 'naklada@verbum.hr'),
('SKAC', '01/4803007', 'nema', 'skac@skac.hr'),
('Symposion', '021/482677', '021/482687', 'info@e-symposion.net'),
('Naklada sv. Antuna', '01/4828823', '01/5552335', 'naklada.sv.antuna@zg.t-com.hr'),
('Oko 3 ujutro', '01/6263980', 'nema', 'oko3ujutro@mail.inet.hr'),
('Informativni centar mir', 'nema', 'nema', 'nema'),
('OS Brezovica', '01/6537155',' 01/6538411', 'osbrezovica@os-brezovica.skole.hr'),
('Salesiana', '01/4814661','01/4814662','salesiana@salesiana.hr'),
('Bono Records', 'nedostupno','nedostupno','nedostupno'),
('Planetopija', '01/4846197', 'nema', 'knjizara@planetopija.hr'),
('U pravi trenutak','091/7883974','nema','nema'),
('Skolska knjiga', '01/4830511','nema','eshop@skolskaknjiga.hr'),
('KIZ', 'nema', 'nema', 'nema'),
('Dean', 'nema', 'nema', 'nema'),
('Krscanska sadasnjost', '01/6349010', '01/4666815', 'uprava@ks.hr'),
('Teovizija','01/4814819', '', 'teovizija@teovizija.hr'),
('printer', 'nema', 'nema', 'nema');

INSERT INTO knjiga(naslov, izdavacID, broj_stranica, cijena, godina_izdanja) VALUES
('Zivot u radosti',1,262, 85, 2014),
('Umijece zivljenja',1, 235, 89, 2016),
('Zivjeti sadasnji trenutak', 1, 63, 35, 2017),
('Istinsko milosrdje', 1, 68, 49, 2016),
('Egzamen', 2, 96, 40, 2017),
('Uskrsnuce - upute za uporabu', 1, 187, 95, 2017),
('Tamna noc', 3, 192, 70, 2012),
('Novo vino - o plodovima Duha', 4, 220, 75, 2015),
('Raditi sa srcem', 5, 112, 30, 2005),
('Biseri ranjena srca', 6, 174, 48, 2009),
('Stihovi pronadjeni medju vlatima trave', 7, 151, 8, 2015),
('Pier Giorgio Frassati: prijatelj siromaha', 8, 239, 80, 2017),
('Cudotvorac iz Padove', 1, 278, 140, 2020),
('Sreca u ovom zivotu', 1, 202, 128, 2018),
('Cetiri ljubavi', 1, 175, 118, 2019),
('Ljubav i odgovornost',1, 335, 130, 2019),
('Pobijedite depresiju snagom vjere', 1, 254, 115, 2015),
('Isusovacki vodic za (gotovo) sve', 2, 378, 50, 2016),
('Nezaustavljiv', 9, 270, 99, 2012),
('Zivot bez ogranicenja', 10, 231, 139, 2011),
('Granice', 1, 351, 168, 2019),
('Ruza Bijela', 11, 220, 0, 2019),
('Tajne uspjesne prodaje', 12, 159, 140, 2005),
('Nista i sve', 13, 392, 100, 2014),
('Monografija OŠ Brezovica', 7, 176, 120, 2010),
('Djakovo', 14, 100, 0, 1995),
('Baza podataka za sveucilisnu drustvenu mrezu', 17, 58,0,2014);



INSERT INTO pisci VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,11),
(13,12),
(14,13),
(15,14),
(16,15),
(17,16),
(18,17),
(19,17),
(20,18),
(21,19),
(21,20),
(22,21),
(23,21),
(24,22),
(25,22),
(26,23),
(27,24),
(28,25),
(29,25),
(30,26),
(31,27);

/*Suma cijena knjiga*/
select sum(cijena) from knjiga;

/*Prosječna cijena knjiga*/
select avg(cijena) from knjiga;

/*Prikaz s popisom knjiga*/
create view oknjizi as
select naslov, prezime, ime, ime_izdavaca
from knjiga join izdavac on knjiga.izdavacID=izdavac.izdavacID  
join pisci on pisci.knjigaID=knjiga.knjigaID
join autor on pisci.autorID=autor.autorID;

/*Ukupan broj stranica pročitanih knjiga*/
select sum(broj_stranica) from knjiga;

/*Prosječan broj stranica knjiga*/
select avg(broj_stranica) from knjiga;

/*Knjige skuplje od prosjeka*/
select * from knjiga where cijena>(select avg(cijena) from knjiga);

/*Verbumove knjige*/
select * from knjiga where izdavacID in
(select izdavacID from izdavac where ime_izdavaca="Verbum");

/*Procedura za knjige navedenog autora*/
CREATE PROCEDURE knjigeautora(
IN imeautora VARCHAR(25),
IN prezimeautora VARCHAR(25))
SELECT * FROM knjiga WHERE knjigaID in
(select knjigaID from pisci where autorID in (
select autorID from autor where ime=imeautora and prezime=prezimeautora));

CALL knjigeautora('Nick', 'Vujicic');

/*Imena i prezimena autora koji su zajedno s nekim pisali knjigu*/
select ime, prezime from autor where autorID in
(select pisci1.autorID from pisci as pisci1 join pisci as pisci2 on pisci1.knjigaID=pisci2.knjigaID where
pisci1.autorID<>pisci2.autorID);

/*Popis knjiga koje je napisalo vise autora*/
select distinct naslov from knjiga join pisci on knjiga.knjigaID=pisci.knjigaID where knjiga.knjigaID in
(select pisci1.knjigaID from pisci as pisci1 join pisci as pisci2 on pisci1.knjigaID=pisci2.knjigaID where
pisci1.autorID<>pisci2.autorID

/*Popis knjiga koje je napisao jedan autor*/
select distinct naslov from knjiga join pisci on knjiga.knjigaID=pisci.knjigaID where knjiga.knjigaID not in
(select pisci1.knjigaID from pisci as pisci1 join pisci as pisci2 on pisci1.knjigaID=pisci2.knjigaID where
pisci1.autorID<>pisci2.autorID);

/*Prikaz koliko je knjiga napisao svaki pisac*/
create view knjigepopiscu as
select prezime, ime, brojknjiga from autor join
(select autorID, count(knjigaID) as brojknjiga from pisci group by autorID) as broj
on autor.autorID=broj.autorID;

select * from knjigepopiscu;

CREATE PROCEDURE jeftinijeod(
IN cijenaunos INT)
SELECT * FROM knjiga where cijena < cijenaunos;

CALL jeftinijeod(100);

CREATE PROCEDURE skupljeod(
IN cijenaunos INT)
SELECT * FROM knjiga where cijena > cijenaunos;

CALL skupljeod(100);