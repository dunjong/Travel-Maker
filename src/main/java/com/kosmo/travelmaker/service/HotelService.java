package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface HotelService {

	boolean deleteHotelByCitiesNo(int cities_no);

	boolean insertHotelByMap(Map map);

	List<HotelDTO> selectHotelDTOByCitiesNo(int cities_no);

	boolean updateHotelInfo(Map map);

	HotelDTO selectHotelDTO(int hotel_no);
	int selectHotelNo();
}
