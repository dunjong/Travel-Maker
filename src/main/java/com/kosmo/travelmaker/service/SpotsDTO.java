package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("spotsDTO")
public class SpotsDTO {
	
	private int spot_no;
	private int save_spot_no;
	
	private String spot_name;
	private String spot_id;
	private String auto_plan_date;
	private String plan_date;
	private int auto_spot_no;
	private int city_no;
	private int plan_no;
	private String latlng;
	
	
	
	public String getLatlng() {
		return latlng;
	}
	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}
	public String getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(String plan_date) {
		this.plan_date = plan_date;
	}
	public int getSave_spot_no() {
		return save_spot_no;
	}
	public void setSave_spot_no(int save_spot_no) {
		this.save_spot_no = save_spot_no;
	}
	public int getAuto_spot_no() {
		return auto_spot_no;
	}
	public void setAuto_spot_no(int auto_spot_no) {
		this.auto_spot_no = auto_spot_no;
	}
	public String getAuto_plan_date() {
		return auto_plan_date;
	}
	public void setAuto_plan_date(String auto_plan_date) {
		this.auto_plan_date = auto_plan_date;
	}
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
	
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
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
