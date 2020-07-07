package com.kosmo.travelmaker.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PlannerDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public boolean insertPlanner(String id) {
		return sqlMapper.insert("insertPlanner",id)==1?true:false;
	}
	public boolean insertCities(int city_no) {
		return sqlMapper.insert("insertCities",city_no)==1?true:false;
	}
}
