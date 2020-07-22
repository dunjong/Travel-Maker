package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("accDTO")
public class AccDTO {
	private int acc_no;
	private int planner_no;
	private String user_id;
	private int allow;
	public int getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
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
	public int getAllow() {
		return allow;
	}
	public void setAllow(int allow) {
		this.allow = allow;
	}
	
	
	
	
}
