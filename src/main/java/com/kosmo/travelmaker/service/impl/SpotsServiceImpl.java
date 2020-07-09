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

	@Override
	public boolean insertSaveSpot(SpotsDTO dto) {
		// TODO Auto-generated method stub
		return spotsDAO.insertSaveSpot(dto);
	}
	@Override
	public List<SpotsDTO> selectSpotDTOList(int plan_no) {
		// TODO Auto-generated method stub
		return spotsDAO.selectSpotDTOList(plan_no);
	}
	
}
