package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("resDTO")
public class ResDTO {

	private int res_no;
	private String user_id;
	private String h_a_no;
	private int res_ok;
	
	public int getRes_ok() {
		return res_ok;
	}
	public void setRes_ok(int res_ok) {
		this.res_ok = res_ok;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getH_a_no() {
		return h_a_no;
	}
	public void setH_a_no(String h_a_no) {
		this.h_a_no = h_a_no;
	}
	
	
	
}
