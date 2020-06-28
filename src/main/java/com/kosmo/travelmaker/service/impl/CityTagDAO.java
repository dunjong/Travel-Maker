package com.kosmo.travelmaker.service.impl;
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class CityTagDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	
}
