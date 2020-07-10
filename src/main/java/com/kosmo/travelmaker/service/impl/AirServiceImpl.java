package com.kosmo.travelmaker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.AirService;

@Service("airService")
public class AirServiceImpl implements AirService {

	@Resource(name="airDAO")
	AirDAO airDAO;
	
	@Override
	public boolean deleteResByCitiesNo(int planner_no) {
		// TODO Auto-generated method stub
		return airDAO.deleteResByCitiesNo(planner_no);
	}
	@Override
	public List<Integer> selectAirResNoByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return airDAO.selectAirResNoByPlannerNo(planner_no);
	}

}
