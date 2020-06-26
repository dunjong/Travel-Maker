package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.SpotsDTO;
import com.kosmo.travelmaker.service.SpotsService;

@Service("spotsService")
public class SpotsServiceImpl implements SpotsService{
	
	@Resource(name = "spotsDAO")
	SpotsDAO spotsDAO;
	
	@Override
	public List<SpotsDTO> spotList(Map map) {
		// TODO Auto-generated method stub
		return spotsDAO.spotList(map);
	}
	
}
