package com.kosmo.travelmaker.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.CityDTO;

@Repository
public class CityDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public CityDTO selectOneCity(int city_no) {
		return sqlMapper.selectOne("selectOneCity",city_no);
		
	}
	
}
