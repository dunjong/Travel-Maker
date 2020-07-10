package com.kosmo.travelmaker.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.HotelService;

@Service("hotelService")
public class HotelServiceImpl implements HotelService {
	
	@Resource(name = "hotelDAO")
	HotelDAO hotelDAO;
	
	@Override
	public boolean deleteHotelByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return hotelDAO.deleteHotelByCitiesNo(cities_no);
	}

}
