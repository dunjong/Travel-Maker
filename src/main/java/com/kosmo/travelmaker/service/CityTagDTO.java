package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository
public class CityTagDTO {
	private String city_name;
	private String tag;
	
	
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
}
