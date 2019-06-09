CREATE DATABASE RENTACAR;
USE RENTACAR;

CREATE TABLE CUSTOMER(
idCustomer int AUTO_INCREMENT,
name varchar(40) NOT NULL,
surnames varchar(120)  NOT NULL,
email varchar(80)  NOT NULL,
password varchar(30)  NOT NULL,
phone int,
country varchar(60) NOT NULL,
birthDate DATE NOT NULL,
primary key (idCustomer)
);
CREATE TABLE LOCATION(
idLocation int auto_increment,
name varchar(100),
primary key (idLocation));

CREATE TABLE BRAND(
idBrand int auto_increment,
name varchar(150),
primary key (idBrand));

CREATE TABLE MODEL(
idModelo int auto_increment,
name varchar(200),
descripcion varchar(600),
idBrand int,
foreign key (idBrand) references BRAND(idBrand),
primary key (idModelo));

CREATE TABLE CAR(
idCar int auto_increment,
imageName varchar(255),
imagePath varchar(255),
enrollment varchar(20),
idBrand int,
idLocation int,
idModel int,
foreign key (idModel) references MODEL(idModelo) on delete cascade,
foreign key (idBrand) references BRAND(idBrand),
foreign key (idLocation) references LOCATION(idLocation),
primary key (idCar)
);

CREATE TABLE RESERVATION(
idReservation int auto_increment,
reservationDate Date,
collectionDate Date,
returnDate Date,
idCar int,
idUser int,
foreign key (idCar) references CAR(idCar),
foreign key (idUser) references CUSTOMER(idCustomer),
primary key (idReservation)
);

INSERT INTO BRAND(name) values ("Renault");
INSERT INTO BRAND(name) values ("Fiat");
INSERT INTO BRAND(name) values ("Opel");
INSERT INTO BRAND(name) values ("Nissan");

INSERT INTO LOCATION(name) values ("Palma");
INSERT INTO LOCATION(name) values ("Ibiza");


select * from car;