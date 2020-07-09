package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.PlannerService;

@Service("plannerService")
public class PlannerServiceImpl implements PlannerService{
	@Resource(name="plannerDAO")
	PlannerDAO plannerDAO;
	
	@Override
	public String AllPlan() {
		
		return null;
	}


	@Override
	public boolean insertPlanner(String id) {
		// TODO Auto-generated method stub
		return plannerDAO.insertPlanner(id);
	}

	@Override
	public boolean insertCities(Map<String, Integer> maps) {
		return plannerDAO.insertCities(maps);
	}

	@Override
	public List<Integer> selectPlannerList(int planner_no) {
		return plannerDAO.selectPlannerList(planner_no);
		
	}


	@Override
	public int selectPlannerNo() {
		return plannerDAO.selectPlannerNo();
	}


	@Override
	public List<CitiesDTO> selectCitiesDTOList(int planner_no) {
		return plannerDAO.selectCitiesDTOList(planner_no);
	}


	@Override
	public int selectCitiesNo() {
		return plannerDAO.selectCitiesNo();
	}

	@Override
	public boolean insertPlan(Map<String, Object> maps2) {
		// TODO Auto-generated method stub
		return plannerDAO.insertPlan(maps2);
	}


	@Override
	public int selectPlanNo() {
		// TODO Auto-generated method stub
		return plannerDAO.selectPlanNo();
	}

	@Override
	public int selectCitiesNoByMap(Map<String, Integer> maps) {
		// TODO Auto-generated method stub
		return plannerDAO.selectCitiesNoByMap(maps);
	}
	
}
