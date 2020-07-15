package com.kosmo.travelmaker.service;

import java.util.List;
import java.util.Map;

public interface CityService {

	CityDTO selectCityDTO(int city_no);

	int selectCityNo(String city_name);

	List<CitiesDTO> selectCitiesDTO(int planner_no);

	String selectCitiesDate(int cities_no);

	boolean updateCitiesDate(Map map);

	List<CountDTO> selectCityCount();

	List<Integer> selectCitiesNoListBycityNo(int city_no);
}
