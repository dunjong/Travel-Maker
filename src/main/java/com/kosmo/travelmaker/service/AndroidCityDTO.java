package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("androidCityDTO")
public class AndroidCityDTO {
	
	private String city_name;
	private String cities_date;
	
	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getCities_date() {
		return cities_date;
	}

	public void setCities_date(String cities_date) {
		this.cities_date = cities_date;
	}

	@Override
	public String toString() {
		return "AndroidCityDTO [city_name=" + city_name + ", cities_date=" + cities_date + "]";
	}

	
	
	
}
