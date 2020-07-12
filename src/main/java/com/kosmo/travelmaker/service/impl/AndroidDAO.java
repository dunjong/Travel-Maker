package com.kosmo.travelmaker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.AndroidCityDTO;

@Repository
public class AndroidDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	public List<String> plannameGet(String user_id) {
		return sqlMapper.selectList("plannameGet",user_id);
	}

	public List<AndroidCityDTO> planCityGet(String planname) {
		return sqlMapper.selectList("planCityGet", planname);
	}
	
}
