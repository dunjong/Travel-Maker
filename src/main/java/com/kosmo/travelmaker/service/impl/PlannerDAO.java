package com.kosmo.travelmaker.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PlannerDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public boolean insertPlanner() {
		return sqlMapper.insert("insertPlanner")==1?true:false;
	}
	public boolean insertCities(String city_no) {
		return sqlMapper.insert("insertCities",city_no)==1?true:false;
	}
}
