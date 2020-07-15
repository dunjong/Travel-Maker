package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.CityDTO;
import com.kosmo.travelmaker.service.CityService;
import com.kosmo.travelmaker.service.CountDTO;

@Service("cityService")
public class CityServiceImpl implements CityService {
	
	@Resource(name="cityDAO")
	CityDAO cityDAO;

	@Override
	public CityDTO selectCityDTO(int city_no) {
		return cityDAO.selectOneCity(city_no);
	}
	@Override
	public int selectCityNo(String city_name) {
		return cityDAO.selectOneCityNo(city_name);
	}
	public void makingplanner(String user_id) {
		cityDAO.makingplanner(user_id);
	}
	@Override
	public List<CitiesDTO> selectCitiesDTO(int planner_no) {
		// TODO Auto-generated method stub
		return cityDAO.selectCitiesDTO(planner_no);
	}
	@Override
	public String selectCitiesDate(int cities_no) {
		// TODO Auto-generated method stub
		return cityDAO.selectCitiesDate(cities_no);
	}
	@Override
	public boolean updateCitiesDate(Map map) {
		// TODO Auto-generated method stub
		return cityDAO.updateCitiesDate(map);
	}
	@Override
	public List<CountDTO> selectCityCount() {
		// TODO Auto-generated method stub
		return cityDAO.selectCityCount();
	}
	@Override
	public List<Integer> selectCitiesNoListBycityNo(int city_no) {
		// TODO Auto-generated method stub
		return cityDAO.selectCitiesNoListBycityNo(city_no);
	}
	
}
