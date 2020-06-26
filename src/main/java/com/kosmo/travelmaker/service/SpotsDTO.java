package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("spotsDTO")
public class SpotsDTO {
	
	private int spot_no;
	private String spot_addr;
	private String spot_name;
	private String spot_latlng;
	private String spot_id;
	private int city_no;
	private int plan_no;
	
	
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public int getSpot_no() {
		return spot_no;
	}
	public void setSpot_no(int spot_no) {
		this.spot_no = spot_no;
	}
	public String getSpot_addr() {
		return spot_addr;
	}
	public void setSpot_addr(String spot_addr) {
		this.spot_addr = spot_addr;
	}
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
	public String getSpot_id() {
		return spot_id;
	}
	public void setSpot_id(String spot_id) {
		this.spot_id = spot_id;
	}
	public int getCity_no() {
		return city_no;
	}
	public void setCity_no(int city_no) {
		this.city_no = city_no;
	}

	
	
	
	
	
}
