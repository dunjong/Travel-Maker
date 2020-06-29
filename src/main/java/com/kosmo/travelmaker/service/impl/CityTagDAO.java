package com.kosmo.travelmaker.service.impl;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.CityTagService;


@Repository
public class CityTagDAO implements CityTagService{
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public boolean TagMatch(String tag) {
		return (Integer)sqlMapper.selectOne("TagMactch",tag)==0? false : true;
	}
	
	
}
