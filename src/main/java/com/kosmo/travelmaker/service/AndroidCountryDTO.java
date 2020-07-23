package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("androidCountryDTO")
public class AndroidCountryDTO {
	
	private String festival_country;

	public String getFestival_country() {
		return festival_country;
	}

	public void setFestival_country(String festival_country) {
		this.festival_country = festival_country;
	}
	
	
	
}
