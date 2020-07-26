package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("hotelDTO")
public class HotelDTO {
	private int hotel_no;
	private String hotel_name;
	private String hotel_city;
	private String hotel_in;
	private String hotel_out;
	private String hotel_price;
	private String hotel_latlng;
	private String hotel_score;
	private int hotel_customer;
	private int hotel_room;
	private int cities_no;
	private String hotel_img;
	
	
	
	
	public String getHotel_img() {
		return hotel_img;
	}
	public void setHotel_img(String hotel_img) {
		this.hotel_img = hotel_img;
	}
	public int getCities_no() {
		return cities_no;
	}
	public void setCities_no(int cities_no) {
		this.cities_no = cities_no;
	}
	public int getHotel_no() {
		return hotel_no;
	}
	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}
	public String getHotel_name() {
		return hotel_name;
	}
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	public String getHotel_city() {
		return hotel_city;
	}
	public void setHotel_city(String hotel_city) {
		this.hotel_city = hotel_city;
	}
	public String getHotel_in() {
		return hotel_in;
	}
	public void setHotel_in(String hotel_in) {
		this.hotel_in = hotel_in;
	}
	public String getHotel_out() {
		return hotel_out;
	}
	public void setHotel_out(String hotel_out) {
		this.hotel_out = hotel_out;
	}
	public String getHotel_price() {
		return hotel_price;
	}
	public void setHotel_price(String hotel_price) {
		this.hotel_price = hotel_price;
	}
	public String getHotel_latlng() {
		return hotel_latlng;
	}
	public void setHotel_latlng(String hotel_latlng) {
		this.hotel_latlng = hotel_latlng;
	}
	public String getHotel_score() {
		return hotel_score;
	}
	public void setHotel_score(String hotel_score) {
		this.hotel_score = hotel_score;
	}
	public int getHotel_customer() {
		return hotel_customer;
	}
	public void setHotel_customer(int hotel_customer) {
		this.hotel_customer = hotel_customer;
	}
	public int getHotel_room() {
		return hotel_room;
	}
	public void setHotel_room(int hotel_room) {
		this.hotel_room = hotel_room;
	}
	
	
	

}
