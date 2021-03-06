package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.AndroidCityDTO;
import com.kosmo.travelmaker.service.AndroidCountryDTO;
import com.kosmo.travelmaker.service.AndroidFestivalDTO;
import com.kosmo.travelmaker.service.AndroidFestivalNameDTO;
import com.kosmo.travelmaker.service.AndroidPlanDTO;
import com.kosmo.travelmaker.service.AndroidSpotDTO;

@Repository
public class AndroidDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	public List<AndroidPlanDTO> plannameGet(String user_id) {
		return sqlMapper.selectList("plannameGet",user_id);
	}

	public List<AndroidCityDTO> planCityGet(String planname) {
		return sqlMapper.selectList("planCityGet", planname);
	}

	public List<AndroidSpotDTO> getSpot(Map citymap) {
		return sqlMapper.selectList("getSpot",citymap);
	}

	public List<AndroidCountryDTO> selectCountry() {
		return sqlMapper.selectList("selectCountry");
	}

	public List<AndroidFestivalNameDTO> selectFestivalName(String festival_country) {
		return sqlMapper.selectList("selectFestivalName",festival_country);
	}

	public AndroidFestivalDTO selectFestival(String festival_name) {
		return sqlMapper.selectOne("selectFestival", festival_name);
	}
	
}
