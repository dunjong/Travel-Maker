
/* Drop Tables */

DROP TABLE refund CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE airticket CASCADE CONSTRAINTS;
DROP TABLE airport CASCADE CONSTRAINTS;
DROP TABLE room CASCADE CONSTRAINTS;
DROP TABLE stayRes CASCADE CONSTRAINTS;
DROP TABLE hotel CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE place CASCADE CONSTRAINTS;
DROP TABLE city CASCADE CONSTRAINTS;
DROP TABLE country CASCADE CONSTRAINTS;
DROP TABLE customerservice CASCADE CONSTRAINTS;
DROP TABLE flight CASCADE CONSTRAINTS;
DROP TABLE luggage CASCADE CONSTRAINTS;
DROP TABLE plan CASCADE CONSTRAINTS;
DROP TABLE plane CASCADE CONSTRAINTS;
DROP TABLE seat CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE airport
(
	airCode nvarchar2(10) NOT NULL,
	airportName nvarchar2(15) NOT NULL,
	couName nvarchar2(20) NOT NULL,
	PRIMARY KEY (airCode)
);


CREATE TABLE airticket
(
	ticketNo number NOT NULL,
	seatNo nvarchar2(5) NOT NULL,
	flightNo nvarchar2(15) NOT NULL,
	lugNo nvarchar2(10) NOT NULL,
	planeNo nvarchar2(10) NOT NULL,
	airCode nvarchar2(10) NOT NULL,
	PRIMARY KEY (ticketNo)
);


CREATE TABLE city
(
	cityName nvarchar2(20) NOT NULL,
	couName nvarchar2(20) NOT NULL,
	PRIMARY KEY (cityName)
);


CREATE TABLE country
(
	couName nvarchar2(20) NOT NULL,
	PRIMARY KEY (couName)
);


CREATE TABLE customerservice
(
	id varchar2(10) NOT NULL
);


CREATE TABLE flight
(
	flightNo nvarchar2(15) NOT NULL,
	distance nchar NOT NULL,
	PRIMARY KEY (flightNo)
);


CREATE TABLE hotel
(
	hotelCode number NOT NULL,
	cityName nvarchar2(20) NOT NULL,
	PRIMARY KEY (hotelCode)
);


CREATE TABLE luggage
(
	lugNo nvarchar2(10) NOT NULL,
	lugweight number NOT NULL,
	PRIMARY KEY (lugNo)
);


CREATE TABLE place
(
	placeid nvarchar2(20) NOT NULL,
	cityName nvarchar2(20) NOT NULL,
	lng nvarchar2(20),
	lat nvarchar2(20),
	PRIMARY KEY (placeid)
);


CREATE TABLE plan
(
	planCode nvarchar2(10) NOT NULL,
	id varchar2(10) NOT NULL,
	PRIMARY KEY (planCode)
);


CREATE TABLE plane
(
	planeNo nvarchar2(10) NOT NULL,
	PRIMARY KEY (planeNo)
);


CREATE TABLE refund
(
	refCode number NOT NULL,
	resNo  number NOT NULL,
	refRule varchar2(10) NOT NULL,
	PRIMARY KEY (refCode)
);


CREATE TABLE reservation
(
	resNo  number NOT NULL,
	id varchar2(10) NOT NULL,
	ticketNo number NOT NULL,
	resRule  nvarchar2(10),
	stayNo number NOT NULL,
	PRIMARY KEY (resNo )
);


CREATE TABLE review
(
	reviewcode nvarchar2(20) NOT NULL,
	placeid nvarchar2(20) NOT NULL,
	id varchar2(10) NOT NULL,
	good nvarchar2(10),
	title nvarchar2(15),
	content nvarchar2(500),
	writedate date DEFAULT SYSDATE,
	PRIMARY KEY (reviewcode)
);


CREATE TABLE room
(
	roomNo number NOT NULL,
	type nvarchar2(10) NOT NULL,
	hotelCode number NOT NULL
);


CREATE TABLE seat
(
	seatNo nvarchar2(5) NOT NULL,
	seatType nvarchar2(10) NOT NULL,
	PRIMARY KEY (seatNo)
);


CREATE TABLE stayRes
(
	stayNo number NOT NULL,
	hotelCode number NOT NULL,
	PRIMARY KEY (stayNo)
);


CREATE TABLE userinfo
(
	userNo number NOT NULL,
	id varchar2(10) NOT NULL,
	name nvarchar2(15) NOT NULL,
	engname nvarchar2(20) NOT NULL,
	pwd nvarchar2(15) NOT NULL,
	rrn number NOT NULL,
	gender nvarchar2(10) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE airticket
	ADD FOREIGN KEY (airCode)
	REFERENCES airport (airCode)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (ticketNo)
	REFERENCES airticket (ticketNo)
;


ALTER TABLE hotel
	ADD FOREIGN KEY (cityName)
	REFERENCES city (cityName)
;


ALTER TABLE place
	ADD FOREIGN KEY (cityName)
	REFERENCES city (cityName)
;


ALTER TABLE airport
	ADD FOREIGN KEY (couName)
	REFERENCES country (couName)
;


ALTER TABLE city
	ADD FOREIGN KEY (couName)
	REFERENCES country (couName)
;


ALTER TABLE airticket
	ADD FOREIGN KEY (flightNo)
	REFERENCES flight (flightNo)
;


ALTER TABLE room
	ADD FOREIGN KEY (hotelCode)
	REFERENCES hotel (hotelCode)
;


ALTER TABLE stayRes
	ADD FOREIGN KEY (hotelCode)
	REFERENCES hotel (hotelCode)
;


ALTER TABLE airticket
	ADD FOREIGN KEY (lugNo)
	REFERENCES luggage (lugNo)
;


ALTER TABLE review
	ADD FOREIGN KEY (placeid)
	REFERENCES place (placeid)
;


ALTER TABLE airticket
	ADD FOREIGN KEY (planeNo)
	REFERENCES plane (planeNo)
;


ALTER TABLE refund
	ADD FOREIGN KEY (resNo )
	REFERENCES reservation (resNo )
;


ALTER TABLE airticket
	ADD FOREIGN KEY (seatNo)
	REFERENCES seat (seatNo)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (stayNo)
	REFERENCES stayRes (stayNo)
;


ALTER TABLE customerservice
	ADD FOREIGN KEY (id)
	REFERENCES userinfo (id)
;


ALTER TABLE plan
	ADD FOREIGN KEY (id)
	REFERENCES userinfo (id)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (id)
	REFERENCES userinfo (id)
;


ALTER TABLE review
	ADD FOREIGN KEY (id)
	REFERENCES userinfo (id)
;



