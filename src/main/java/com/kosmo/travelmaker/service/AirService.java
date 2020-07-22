package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface AirService {

	boolean deleteAirRes(AirDTO dto);

	List<AirDTO> selectAirResById(String id);
	
	AirDTO selectAirByResNo(int Res_no);

	boolean insertAirDtoToAir(int air_no);
	
	boolean insertAirDtoToRes(AirDTO dto);

	int CompareTimePlace(String ddate, String departure, String arrival);

	List<AirDTO> selectAirDTOByplannerNo(int planner_no);

	boolean deleteAirByPlannerNo(int planner_no);

	List<AirDTO> selectAirDTOList(String user_id);

	AirDTO selectAirDTO(int air_no);

	int selectAirNo();

}
