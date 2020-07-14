package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("androidSpotDTO")
public class AndroidSpotDTO {
	
	private String spot_name;
	private String spot_latlng;
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}
	public String getSpot_latlng() {
		return spot_latlng;
	}
	public void setSpot_latlng(String spot_latlng) {
		this.spot_latlng = spot_latlng;
	}
	
	
	@Override
	public String toString() {
		return "AndroidSpotDTO [spot_name=" + spot_name + ", spot_latlng=" + spot_latlng + "]";
	}
	
	
	
}
