package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface SpotsService {
	List<SpotsDTO> spotList(Map map);
	boolean insertSaveSpot(SpotsDTO dto);
	List<SpotsDTO> selectSpotDTOList(int plan_no);
}
