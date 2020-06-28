package com.kosmo.travelmaker.service.impl;
import javax.annotation.Resource;
import com.kosmo.travelmaker.service.CityTagService;

public class CityTagServiceImpl implements CityTagService{
	@Resource(name="cityTagDAO")
	private CityTagDAO cityTagDAO;
	
	

}
