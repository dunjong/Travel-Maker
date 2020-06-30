package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("cityDTO")
public class CityDTO {

	private int city_no;
	private String city_name;
	private String city_intro;
	private String city_img;
	public int getCity_no() {
		return city_no;
	}
	public void setCity_no(int city_no) {
		this.city_no = city_no;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getCity_intro() {
		return city_intro;
	}
	public void setCity_intro(String city_intro) {
		this.city_intro = city_intro;
	}
	public String getCity_img() {
		return city_img;
	}
	public void setCity_img(String city_img) {
		this.city_img = city_img;
	}
	
	
	
	
}
