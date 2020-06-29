package com.kosmo.travelmaker.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.CityTagService;

@Service("cityTagService")
public class CityTagServiceImpl implements CityTagService{
	@Resource(name="cityTagDAO")
	private CityTagDAO dao;

	@Override
	public boolean TagMatch(String tag) {
		
		return dao.TagMatch(tag);
	}
	
	
	
	

}
