package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.AndroidCityDTO;
import com.kosmo.travelmaker.service.AndroidPlanDTO;
import com.kosmo.travelmaker.service.AndroidService;
import com.kosmo.travelmaker.service.AndroidSpotDTO;

@Service("androidService")
public class AndroidServiceImpl implements AndroidService{
	@Resource(name="androidDAO")
	AndroidDAO dao;

	@Override
	public List<AndroidPlanDTO> plannameGet(String user_id) {
		return dao.plannameGet(user_id);
	}

	public List<AndroidCityDTO> planCityGet(String planname) {
		return dao.planCityGet(planname);
	}

	public List<AndroidSpotDTO> getSpot(Map citymap) {
		return dao.getSpot(citymap);
	}
}
