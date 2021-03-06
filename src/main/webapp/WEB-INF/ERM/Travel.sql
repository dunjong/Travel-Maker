
/* Drop Tables */

DROP TABLE accompany CASCADE CONSTRAINTS;
DROP TABLE air CASCADE CONSTRAINTS;
DROP TABLE review_like CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE auto_spots CASCADE CONSTRAINTS;
DROP TABLE auto_plan CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE hotel CASCADE CONSTRAINTS;
DROP TABLE save_spots CASCADE CONSTRAINTS;
DROP TABLE plan CASCADE CONSTRAINTS;
DROP TABLE cities CASCADE CONSTRAINTS;
DROP TABLE tag_rel CASCADE CONSTRAINTS;
DROP TABLE city CASCADE CONSTRAINTS;
DROP TABLE planner CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE tag CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE seq_acc;
DROP SEQUENCE seq_air;
DROP SEQUENCE seq_auto_plan;
DROP SEQUENCE seq_chat;
DROP SEQUENCE seq_cities;
DROP SEQUENCE seq_city;
DROP SEQUENCE seq_festival;
DROP SEQUENCE seq_festival2;
DROP SEQUENCE seq_hotel;
DROP SEQUENCE seq_plan;
DROP SEQUENCE seq_planner;
DROP SEQUENCE seq_res;
DROP SEQUENCE seq_review;
DROP SEQUENCE seq_review_like;
DROP SEQUENCE seq_spot_auto;
DROP SEQUENCE seq_spot_save;
DROP SEQUENCE seq_tag;
DROP SEQUENCE seq_tag_rel;




/* Create Sequences */

CREATE SEQUENCE seq_acc;
CREATE SEQUENCE seq_air;
CREATE SEQUENCE seq_auto_plan;
CREATE SEQUENCE seq_chat;
CREATE SEQUENCE seq_cities;
CREATE SEQUENCE seq_city;
CREATE SEQUENCE seq_festival;
CREATE SEQUENCE seq_festival2;
CREATE SEQUENCE seq_hotel;
CREATE SEQUENCE seq_plan;
CREATE SEQUENCE seq_planner;
CREATE SEQUENCE seq_res;
CREATE SEQUENCE seq_review;
CREATE SEQUENCE seq_review_like;
CREATE SEQUENCE seq_spot_auto;
CREATE SEQUENCE seq_spot_save;
CREATE SEQUENCE seq_tag;
CREATE SEQUENCE seq_tag_rel;



/* Create Tables */

CREATE TABLE accompany
(
	acc_no number NOT NULL,
	planner_no number NOT NULL,
	user_id nvarchar2(200) NOT NULL,
	allow number,
	PRIMARY KEY (acc_no)
);


CREATE TABLE air
(
	air_no number NOT NULL,
	air_ddate nvarchar2(200) NOT NULL,
	air_adate nvarchar2(200) NOT NULL,
	air_price nvarchar2(200) NOT NULL,
	air_time nvarchar2(50) NOT NULL,
	air_passenger number DEFAULT 1 NOT NULL,
	air_dep nvarchar2(200) DEFAULT '서울' NOT NULL,
	air_arr nvarchar2(200) NOT NULL,
	air_via number NOT NULL,
	planner_no number NOT NULL,
	PRIMARY KEY (air_no)
);


CREATE TABLE auto_plan
(
	auto_plan_no number NOT NULL,
	auto_plan_date nvarchar2(200),
	city_no number NOT NULL,
	PRIMARY KEY (auto_plan_no)
);


CREATE TABLE auto_spots
(
	auto_spot_no number NOT NULL,
	spot_name nvarchar2(200) NOT NULL,
	spot_id nvarchar2(200) NOT NULL UNIQUE,
	spot_latlng nvarchar2(200) NOT NULL,
	auto_plan_no number NOT NULL,
	PRIMARY KEY (auto_spot_no)
);


CREATE TABLE chat
(
	chat_no number NOT NULL,
	planner_no number NOT NULL,
	user_id nvarchar2(200) NOT NULL,
	chat_time timestamp DEFAULT sysdate NOT NULL,
	chat_text nvarchar2(2000),
	PRIMARY KEY (chat_no)
);


CREATE TABLE cities
(
	cities_no number NOT NULL,
	city_no number NOT NULL,
	planner_no number NOT NULL,
	cities_date nvarchar2(200),
	PRIMARY KEY (cities_no)
);


CREATE TABLE city
(
	city_no number NOT NULL,
	city_name nvarchar2(200) NOT NULL,
	city_intro nvarchar2(200),
	city_img nvarchar2(500) NOT NULL,
	city_latlng nvarchar2(200) NOT NULL,
	PRIMARY KEY (city_no)
);


CREATE TABLE hotel
(
	hotel_no number NOT NULL,
	hotel_name nvarchar2(200) NOT NULL,
	hotel_city nvarchar2(200) NOT NULL,
	hotel_in nvarchar2(200) NOT NULL,
	hotel_out nvarchar2(200) NOT NULL,
	hotel_customer number DEFAULT 1 NOT NULL,
	hotel_room number DEFAULT 1 NOT NULL,
	hotel_price nvarchar2(200) NOT NULL,
	hotel_latlng nvarchar2(200) NOT NULL,
	hotel_score nvarchar2(50) NOT NULL,
	hotel_img nvarchar2(500),
	cities_no number NOT NULL,
	PRIMARY KEY (hotel_no)
);


CREATE TABLE plan
(
	plan_no number NOT NULL,
	plan_date nvarchar2(200) NOT NULL,
	cities_no number,
	PRIMARY KEY (plan_no)
);


CREATE TABLE planner
(
	planner_no number NOT NULL,
	planner_acc number DEFAULT 0 NOT NULL,
	planner_name nvarchar2(200),
	user_id nvarchar2(200) NOT NULL,
	total_count number,
	PRIMARY KEY (planner_no)
);


CREATE TABLE reservation
(
	res_no number NOT NULL,
	user_id nvarchar2(200),
	h_a_no nvarchar2(100) NOT NULL,
	res_ok number DEFAULT 0,
	PRIMARY KEY (res_no)
);


CREATE TABLE review
(
	review_no number NOT NULL,
	user_id nvarchar2(200),
	auto_spot_no number,
	city_no number NOT NULL,
	review_title nvarchar2(100) NOT NULL,
	review_content nvarchar2(1000) NOT NULL,
	review_date date NOT NULL,
	review_file nvarchar2(400),
	PRIMARY KEY (review_no)
);


CREATE TABLE review_like
(
	re_likeno number NOT NULL,
	user_id nvarchar2(200) NOT NULL,
	review_no number NOT NULL,
	re_hateno number NOT NULL,
	PRIMARY KEY (re_likeno)
);


CREATE TABLE save_spots
(
	save_spot_no number NOT NULL,
	spot_name nvarchar2(200) NOT NULL,
	spot_id nvarchar2(200) NOT NULL,
	spot_latlng nvarchar2(200) NOT NULL,
	plan_no number,
	PRIMARY KEY (save_spot_no)
);


CREATE TABLE tag
(
	tag_no number NOT NULL,
	tag_name nvarchar2(200) NOT NULL,
	PRIMARY KEY (tag_name)
);


CREATE TABLE tag_rel
(
	tal_rel_no number NOT NULL,
	tag_name nvarchar2(200) NOT NULL,
	city_no number NOT NULL,
	PRIMARY KEY (tal_rel_no)
);


CREATE TABLE userinfo
(
	user_id nvarchar2(200) NOT NULL,
	user_name nvarchar2(200),
	user_pwd nvarchar2(50) NOT NULL,
	user_rrn nvarchar2(40) NOT NULL,
	user_gender nvarchar2(10) NOT NULL,
	id_no nvarchar2(100),
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE auto_spots
	ADD FOREIGN KEY (auto_plan_no)
	REFERENCES auto_plan (auto_plan_no)
;


ALTER TABLE review
	ADD FOREIGN KEY (auto_spot_no)
	REFERENCES auto_spots (auto_spot_no)
;


ALTER TABLE hotel
	ADD FOREIGN KEY (cities_no)
	REFERENCES cities (cities_no)
;


ALTER TABLE plan
	ADD FOREIGN KEY (cities_no)
	REFERENCES cities (cities_no)
;


ALTER TABLE auto_plan
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE cities
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE review
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE tag_rel
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE save_spots
	ADD FOREIGN KEY (plan_no)
	REFERENCES plan (plan_no)
;


ALTER TABLE accompany
	ADD FOREIGN KEY (planner_no)
	REFERENCES planner (planner_no)
;


ALTER TABLE air
	ADD FOREIGN KEY (planner_no)
	REFERENCES planner (planner_no)
;


ALTER TABLE chat
	ADD FOREIGN KEY (planner_no)
	REFERENCES planner (planner_no)
;


ALTER TABLE cities
	ADD FOREIGN KEY (planner_no)
	REFERENCES planner (planner_no)
;


ALTER TABLE review_like
	ADD FOREIGN KEY (review_no)
	REFERENCES review (review_no)
;


ALTER TABLE tag_rel
	ADD FOREIGN KEY (tag_name)
	REFERENCES tag (tag_name)
;


ALTER TABLE accompany
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;


ALTER TABLE chat
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;


ALTER TABLE planner
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;


ALTER TABLE review
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;


ALTER TABLE review_like
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;



