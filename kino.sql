CREATE DATABASE MojeKino;
CREATE TABLE FILMY( 
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    TYTUL varchar(255) NOT NULL, 
    REZYSER varchar(255) NOT NULL, 
    CZAS_TRWANIA int NOT NULL); 


CREATE TABLE SALE(
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ILOSC_MIEJSC int NOT NULL
    );


CREATE TABLE SEANSE(
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TERMIN datetime NOT NULL,
    SALA_ID bigint NOT NULL,
    FILM_ID bigint NOT NULL,
    LICZBA_WOLNYCH_MIEJSC int NOT NULL,
    
    CONSTRAINT `sala_fk` FOREIGN KEY (`SALA_ID`) 
    REFERENCES SALE(`ID`),
    
    CONSTRAINT `film_fk` FOREIGN KEY (`FILM_ID`) 
    REFERENCES FILMY(`ID`)
);


CREATE TABLE KLIENCI(
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    IMIE varchar(255) NOT NULL,
    NAZWISKO varchar(255) NOT NULL,
    MAIL varchar(255) NOT NULL
    );


CREATE TABLE SPRZEDAWCY(
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    IMIE varchar(255) NOT NULL,
    NAZWISKO varchar(255) NOT NULL
    );


CREATE TABLE BILETY(
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    SEANS_ID bigint NOT NULL,
    SPRZEDAWCA_ID bigint NOT NULL,
    KLIENT_ID bigint NOT NULL,
    CENA int NOT NULL, 
    
    CONSTRAINT `seans_fk` FOREIGN KEY (`SEANS_ID`) 
    REFERENCES  SEANSE(`ID`),

    CONSTRAINT `sprzedawca_fk` FOREIGN KEY (`SPRZEDAWCA_ID`)
    REFERENCES  SPRZEDAWCY(`ID`),

    CONSTRAINT `klient_ID` FOREIGN KEY (`KLIENT_ID`)
    REFERENCES  KLIENCI(`ID`)

);

CREATE TABLE FILMY_RODZAJ(
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    FILMY_ID  bigint NOT NULL,
    RODZAJ_ID bigint NOT NULL
);

CREATE TABLE RODZAJ_FILMU(
    ID bigint AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NAZWA varchar(255) NOT NULL
);

INSERT INTO `SPRZEDAWCY` (`IMIE`,`NAZWISKO`) VALUES
("KACPER","ROBAKOWSKI"),
("MARCIN","LEJK"),
("AUGUST","CZARNY"),
("NIKODEM","MALY"),
("RAFAL","TRZASKOWSKI");

INSERT INTO `RODZAJ_FILMU` (`NAZWA`) VALUES
("Dramat"),
("Komedia"),
("Thriller"),
("Akcji"),
("Romantyczny");

INSERT INTO `SALE` (`ILOSC_MIEJSC`) VALUES
(50),
(75),
(100),
(144),
(144);

INSERT INTO `KLIENCI` (`IMIE`,`NAZWISKO`,`MAIL`) VALUES
("Kacper", "Malinowski", "malinakapi2006@gmail.com"),
("Nikodem", "Czerwiński", "jamal366@gmail.com"),
("Piotr", "Detkiewicz", "grzbynokoks@gmail.com"),
("Mariusz", "Nalepa", "nalepa1985@gmail.com"),
("Piotr", "Kasztanowski", "Piter@gmail.com");

INSERT INTO `FILMY` (`TYTUL`,`REZYSER`,`CZAS_TRWANIA`) VALUES
("Tuż po zmroku", "Benjamin Brewer", 82),
("Rytułał śmierci", "George Gallo", 92),
("Uległość", "S.K. Dale", 95),
("Ona słucha", "Chris Weitz", 123),
("After 5. Na zawsze", "Castille Landon", 95);