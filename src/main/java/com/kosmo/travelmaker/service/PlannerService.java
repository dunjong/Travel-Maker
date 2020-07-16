package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface PlannerService {
	public String AllPlan();
	public boolean insertPlanner(String id);
	public boolean insertCities(Map<String, String> maps);
	public List<Integer> selectPlannerList(int planner_no);
	public int selectPlannerNo();
	List<CitiesDTO> selectCitiesDTOList(int planner_no);
	public int selectCitiesNo();
	public boolean insertPlan(Map<String, Object> maps2);
	public int selectPlanNo();
	int selectCitiesNoByMap(Map<String, Integer> maps);
	List<Integer> selectPlanNoByCitiesNo(int cities_no);
	List<PlanDTO> selectPlanDTOByCitiesNo(int cities_no);
	boolean deletePlanByNo(int plan_no);
	boolean deleteCitiesByNo(int cities_no);
	boolean deletePlannerByNo(int planner_no);
	boolean deletePlanByCitiesNo(int cities_no);
	boolean deleteCitiesByPlannerNo(int planner_no);
	boolean updatePlannerName(Map map);
	List<PlannerDTO> selectPlannerDTOByNo(int planner_no);
	PlannerDTO selectPlannerDTOBycitiesNo(int cities_no);
	boolean updateAccNo(Map<String, String> maps);
	boolean insertAcc(Map<String, String> maps);
	int selectAccNoByPlannerNo(int planner_no);
	List<Integer> selectPlannerNoListById(String user_id);
	boolean DeleteAcc(Map<String, String> maps);
}
