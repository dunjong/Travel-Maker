package com.kosmo.travelmaker.service;

import java.util.List;

public interface AirService {

	boolean deleteResByCitiesNo(int planner_no);

	List<Integer> selectAirResNoByPlannerNo(int planner_no);

}
