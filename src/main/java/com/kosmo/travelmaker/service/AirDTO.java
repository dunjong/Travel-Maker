package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("airDTO")
public class AirDTO {

	private int air_no;
	private String air_ddate;
	private String air_rdate;
	private String air_price;
	private String air_class;
	private String air_dep;
	private String air_arr;
	private int air_passenger;
	
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
	public String getAir_rdate() {
		return air_rdate;
	}
	public void setAir_rdate(String air_rdate) {
		this.air_rdate = air_rdate;
	}
	public String getAir_price() {
		return air_price;
	}
	public void setAir_price(String air_price) {
		this.air_price = air_price;
	}
	public String getAir_class() {
		return air_class;
	}
	public void setAir_class(String air_class) {
		this.air_class = air_class;
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
