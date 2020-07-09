package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface PlannerService {
	public String AllPlan();
	public boolean insertPlanner(String id);
	public boolean insertCities(Map<String, Integer> maps);
	public List<Integer> selectPlannerList(int planner_no);
	public int selectPlannerNo();
	List<CitiesDTO> selectCitiesDTOList(int planner_no);
	public int selectCitiesNo();
	public boolean insertPlan(Map<String, Object> maps2);
	public int selectPlanNo();
	int selectCitiesNoByMap(Map<String, Integer> maps);
	List<Integer> selectPlanNoByCitiesNo(int cities_no);
	List<PlannerDTO> selectPlanDTOByCitiesNo(int cities_no);
}
