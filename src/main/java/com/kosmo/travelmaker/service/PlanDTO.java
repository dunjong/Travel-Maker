package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;
@Repository("planDTO")
public class PlanDTO {
	private int plan_no;
	private String plan_date;
	private int cities_no;
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(String plan_date) {
		this.plan_date = plan_date;
	}
	public int getCities_no() {
		return cities_no;
	}
	public void setCities_no(int cities_no) {
		this.cities_no = cities_no;
	}
	
	
	
	
	
}
