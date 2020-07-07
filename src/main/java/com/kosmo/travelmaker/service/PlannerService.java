package com.kosmo.travelmaker.service;

import java.util.List;

public interface PlannerService {
	public String AllPlan();
	public boolean insertPlanner();
	public boolean insertCities(String city_no);
}
