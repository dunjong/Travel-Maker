package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("citiesDTO")
public class CitiesDTO {

	private int cities_no;
	private int city_no;
	private int planner_no;
	private String cities_date;
	
	
	
	public String getCities_date() {
		return cities_date;
	}
	public void setCities_date(String cities_date) {
		this.cities_date = cities_date;
	}
	public int getCities_no() {
		return cities_no;
	}
	public void setCities_no(int cities_no) {
		this.cities_no = cities_no;
	}
	public int getCity_no() {
		return city_no;
	}
	public void setCity_no(int city_no) {
		this.city_no = city_no;
	}
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	
	
	
}
