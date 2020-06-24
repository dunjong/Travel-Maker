
/* Drop Tables */

DROP TABLE airport CASCADE CONSTRAINTS;
DROP TABLE planner CASCADE CONSTRAINTS;
DROP TABLE place CASCADE CONSTRAINTS;
DROP TABLE city CASCADE CONSTRAINTS;
DROP TABLE country CASCADE CONSTRAINTS;
DROP TABLE customerservice CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE airport
(
	airCode nvarchar2(10) NOT NULL,
	airportName nvarchar2(15) NOT NULL,
	couName nvarchar2(20) NOT NULL,
	PRIMARY KEY (airCode)
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


CREATE TABLE place
(
	placeid nvarchar2(20) NOT NULL,
	lng nvarchar2(20),
	lat nvarchar2(20),
	cityName nvarchar2(20) NOT NULL,
	PRIMARY KEY (placeid)
);


CREATE TABLE planner
(
	planCode nvarchar2(10) NOT NULL,
	id varchar2(10) NOT NULL,
	placeid nvarchar2(20) NOT NULL,
	PRIMARY KEY (planCode)
);


CREATE TABLE review
(
	reviewcode nvarchar2(20) NOT NULL,
	id varchar2(10) NOT NULL,
	good nvarchar2(10),
	title nvarchar2(15),
	content nvarchar2(500),
	writedate date DEFAULT SYSDATE,
	img nvarchar2(25),
	PRIMARY KEY (reviewcode)
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


ALTER TABLE planner
	ADD FOREIGN KEY (placeid)
	REFERENCES place (placeid)
;


ALTER TABLE customerservice
	ADD FOREIGN KEY (id)
	REFERENCES userinfo (id)
;


ALTER TABLE planner
	ADD FOREIGN KEY (id)
	REFERENCES userinfo (id)
;


ALTER TABLE review
	ADD FOREIGN KEY (id)
	REFERENCES userinfo (id)
;



