package com.kosmo.travelmaker.service;

import java.util.List;

public interface PlannerService {
	public String AllPlan();
	public boolean insertPlanner(String id);
	public boolean insertCities(int city_no);
}
