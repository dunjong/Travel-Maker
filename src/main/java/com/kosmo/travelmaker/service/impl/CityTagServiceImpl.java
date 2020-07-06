package com.kosmo.travelmaker.service.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.CityTagDTO;
import com.kosmo.travelmaker.service.CityTagService;

@Service("cityTagService")
public class CityTagServiceImpl implements CityTagService{
	@Resource(name="cityTagDAO")
	private CityTagDAO dao;

	@Override
	public boolean TagMatch(String tag) {
		
		return dao.TagMatch(tag);
	}

	@Override
	public List<CityTagDTO> CityTag(Map map) {
		
		return dao.CityTag(map);
	}

	@Override
	public List<String> searchCityList(String search_keyword) {
		return dao.searchCityList(search_keyword);
	}

	@Override
	public Map checkcity(String search_city) {
		return dao.checkcity(search_city);
	}
	
	
	
	

}
