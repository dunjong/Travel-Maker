package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.CityDTO;
import com.kosmo.travelmaker.service.CountDTO;

@Repository
public class CityDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public CityDTO selectOneCity(int city_no) {
		return sqlMapper.selectOne("selectOneCity",city_no);
		
	}

	public int selectOneCityNo(String city_name) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectOneCityNo",city_name);
	}

	public void makingplanner(String user_id) {
		sqlMapper.insert("makingplanner",user_id);
	}

	public List<CitiesDTO> selectCitiesDTO(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectCitiesDTO", planner_no);
	}

	public String selectCitiesDate(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectCitiesDate", cities_no);
	}

	public boolean updateCitiesDate(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateCitiesDate", map)==1?true:false;
	}

	public List<CountDTO> selectCityCount() {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectCityCount");
	}

	public List<Integer> selectCitiesNoListBycityNo(int city_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectCitiesNoListBycityNo",city_no);
	}
	
}
