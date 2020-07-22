package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("androidFestivalNameDTO")
public class AndroidFestivalNameDTO {
	
	private String festival_name;

	public String getFestival_name() {
		return festival_name;
	}

	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}
	
	
	
}
