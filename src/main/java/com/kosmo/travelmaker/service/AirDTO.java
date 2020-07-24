package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("airDTO")
public class AirDTO {
	private int air_no;
	private String air_ddate;
	private String air_adate;
	private String air_time;
	private String air_via;
	private String air_price;
	private String air_dep;
	private String air_arr;
	private int air_passenger;
	private String user_id;
	private int planner_no;
	
	public String getAir_adate() {
		return air_adate;
	}
	public void setAir_adate(String air_adate) {
		this.air_adate = air_adate;
	}
	public String getAir_time() {
		return air_time;
	}
	public void setAir_time(String air_time) {
		this.air_time = air_time;
	}
	public String getAir_via() {
		return air_via;
	}
	public void setAir_via(String air_via) {
		this.air_via = air_via;
	}
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAir_no() {
		return air_no;
	}
	public void setAir_no(int air_no) {
		this.air_no = air_no;
	}
	public String getAir_ddate() {
		return air_ddate;
	}
	public void setAir_ddate(String air_ddate) {
		this.air_ddate = air_ddate;
	}
	public String getAir_price() {
		return air_price;
	}
	public void setAir_price(String air_price) {
		this.air_price = air_price;
	}
	public String getAir_dep() {
		return air_dep;
	}
	public void setAir_dep(String air_dep) {
		this.air_dep = air_dep;
	}
	public String getAir_arr() {
		return air_arr;
	}
	public void setAir_arr(String air_arr) {
		this.air_arr = air_arr;
	}
	public int getAir_passenger() {
		return air_passenger;
	}
	public void setAir_passenger(int air_passenger) {
		this.air_passenger = air_passenger;
	}
	
	
	
}
