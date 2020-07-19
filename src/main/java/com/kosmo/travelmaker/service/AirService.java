package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface AirService {

	boolean deleteAirRes(AirDTO dto);

	List<AirDTO> selectAirResById(String id);
	
	AirDTO selectAirByResNo(int Res_no);

	boolean insertAirDtoToAir(int air_no);
	
	boolean insertAirDtoToRes(AirDTO dto);

}
