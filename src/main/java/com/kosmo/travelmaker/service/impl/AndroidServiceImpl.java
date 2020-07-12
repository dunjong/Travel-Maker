package com.kosmo.travelmaker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.AndroidCityDTO;
import com.kosmo.travelmaker.service.AndroidService;

@Service("androidService")
public class AndroidServiceImpl implements AndroidService{
	@Resource(name="androidDAO")
	AndroidDAO dao;

	@Override
	public List<String> plannameGet(String user_id) {
		return dao.plannameGet(user_id);
	}

	public List<AndroidCityDTO> planCityGet(String planname) {
		return dao.planCityGet(planname);
	}
}
