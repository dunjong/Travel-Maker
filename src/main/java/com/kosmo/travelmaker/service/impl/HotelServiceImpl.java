package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.HotelDTO;
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
	@Override
	public boolean insertHotelByMap(Map map) {
		// TODO Auto-generated method stub
		return hotelDAO.insertHotelByMap(map);
	}
	@Override
	public List<HotelDTO> selectHotelDTOByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return hotelDAO.selectHotelDTOByCitiesNo(cities_no);
	}
	@Override
	public boolean updateHotelInfo(Map map) {
		// TODO Auto-generated method stub
		return hotelDAO.updateHotelInfo(map);
	}

}
