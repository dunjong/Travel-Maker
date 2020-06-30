package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository
public class CityTagDTO {
	private String city_name;
	private String count;
	private String city_no;
	private String city_intro;
	
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getCity_no() {
		return city_no;
	}
	public void setCity_no(String city_no) {
		this.city_no = city_no;
	}
	public String getCity_intro() {
		return city_intro;
	}
	public void setCity_intro(String city_intro) {
		this.city_intro = city_intro;
	}
	
	
}
