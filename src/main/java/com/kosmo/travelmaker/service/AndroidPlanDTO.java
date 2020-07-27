package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("androidPlanDTO")
public class AndroidPlanDTO {
	
	private String planner_no;
	private String planner_name;
	private String total_count;
	public String getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(String planner_no) {
		this.planner_no = planner_no;
	}
	public String getPlanner_name() {
		return planner_name;
	}
	public void setPlanner_name(String planner_name) {
		this.planner_name = planner_name;
	}
	@Override
	public String toString() {
		return "AndroidPlanDTO [planner_no=" + planner_no + ", planner_name=" + planner_name + "]";
	}
	public String getTotal_count() {
		return total_count;
	}
	public void setTotal_count(String total_count) {
		this.total_count = total_count;
	}
	
	
}
