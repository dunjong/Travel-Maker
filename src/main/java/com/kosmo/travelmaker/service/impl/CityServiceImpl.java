package com.kosmo.travelmaker.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.CityDTO;
import com.kosmo.travelmaker.service.CityService;

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
	
}
