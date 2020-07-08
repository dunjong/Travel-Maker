package com.kosmo.travelmaker.service;

import java.util.Map;

public interface CityService {

	CityDTO selectCityDTO(int city_no);

	int selectCityNo(String city_name);
}
