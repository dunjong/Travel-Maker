package com.kosmo.travelmaker.service.impl;
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.CityTagService;


@Repository
public class CityTagDAO implements CityTagService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	
}
