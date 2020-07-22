package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("androidFestivalDTO")
public class AndroidFestivalDTO {
	
	private String festival_local;
	private String festival_season;
	private String festival_spot;
	private String festival_content;
	public String getFestival_local() {
		return festival_local;
	}
	public void setFestival_local(String festival_local) {
		this.festival_local = festival_local;
	}
	public String getFestival_season() {
		return festival_season;
	}
	public void setFestival_season(String festival_season) {
		this.festival_season = festival_season;
	}
	public String getFestival_spot() {
		return festival_spot;
	}
	public void setFestival_spot(String festival_spot) {
		this.festival_spot = festival_spot;
	}
	public String getFestival_content() {
		return festival_content;
	}
	public void setFestival_content(String festival_content) {
		this.festival_content = festival_content;
	}

	
	
	
}
