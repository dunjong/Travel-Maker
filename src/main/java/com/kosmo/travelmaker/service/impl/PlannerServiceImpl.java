package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.AccDTO;
import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.PlanDTO;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.PlannerService;
import com.kosmo.travelmaker.service.ResDTO;

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
	public boolean insertCities(Map<String, String> maps) {
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

	@Override
	public List<Integer> selectPlanNoByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return plannerDAO.selectPlanNoByCitiesNo(cities_no);
	}

	@Override
	public List<PlanDTO> selectPlanDTOByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return plannerDAO.selectPlanDTOByCitiesNo(cities_no);
	}

	@Override
	public boolean deletePlanByNo(int plan_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deletePlanByNo(plan_no);
	}

	@Override
	public boolean deleteCitiesByNo(int cities_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deleteCitiesByNo(cities_no);
	}


	@Override
	public boolean deletePlannerByNo(int planner_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deletePlannerByNo(planner_no);
	}

	@Override
	public boolean deletePlanByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deletePlanByCitiesNo(cities_no);
	}

	@Override
	public boolean deleteCitiesByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deleteCitiesByPlannerNo(planner_no);
	}

	@Override
	public boolean updatePlannerName(Map map) {
		// TODO Auto-generated method stub
		return plannerDAO.updatePlannerName(map);
	}

	@Override
	public List<PlannerDTO> selectPlannerDTOByNo(int planner_no) {
		// TODO Auto-generated method stub
		return plannerDAO.selectPlannerDTOByNo(planner_no);
	}

	@Override
	public PlannerDTO selectPlannerDTOBycitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return plannerDAO.selectPlannerDTOBycitiesNo(cities_no);
	}

	@Override
	public boolean updateAccNo(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return plannerDAO.updateAccNo(maps);
	}

	@Override
	public boolean insertAcc(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return plannerDAO.insertAcc(maps);
	}

	@Override
	public int selectAccNoByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return plannerDAO.selectAccNoByPlannerNo(planner_no);
	}

	@Override
	public List<Integer> selectPlannerNoListById(String user_id) {
		// TODO Auto-generated method stub
		return plannerDAO.selectPlannerNoListById(user_id);
	}

	@Override
	public boolean DeleteAcc(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return plannerDAO.DeleteAcc(maps);
	}

	@Override
	public boolean deleteAccByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deleteAccByPlannerNo(planner_no);
	}

	@Override
	public List<ResDTO> selectResDTOListByPlannerNo(String user_id) {
		// TODO Auto-generated method stub
		return plannerDAO.selectResDTOListByPlannerNo(user_id);
	}

	@Override
	public void insertRes(Map map) {
		// TODO Auto-generated method stub
		plannerDAO.insertRes(map);
	}

	@Override
	public boolean deleteResByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deleteResByPlannerNo(planner_no);
	}

	@Override
	public boolean deleteResByHotelNo(String h_a_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deleteResByHotelNo(h_a_no);
	}

	@Override
	public boolean deleteResByAirNo(String h_a_no) {
		// TODO Auto-generated method stub
		return plannerDAO.deleteResByAirNo(h_a_no);
	}

	@Override
	public List<AccDTO> selectAccNosByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return plannerDAO.selectAccNosByPlannerNo(planner_no);
	}

	
}
