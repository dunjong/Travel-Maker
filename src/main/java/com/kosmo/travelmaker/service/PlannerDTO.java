package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("plannerDTO")
public class PlannerDTO {

	private int planner_no;
	private int planner_acc;
	private int city_no;
	private String user_id;
	
	public int getPlanner_acc() {
		return planner_acc;
	}
	public void setPlanner_acc(int planner_acc) {
		this.planner_acc = planner_acc;
	}
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	public int getCity_no() {
		return city_no;
	}
	public void setCity_no(int city_no) {
		this.city_no = city_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
}
