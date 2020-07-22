package com.kosmo.travelmaker.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.AirDTO;

@Repository
public class AirDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	public boolean deleteAirRes(AirDTO dto) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteAirRes",dto)!=0?true:false;
	}

	public List<AirDTO> selectAirResById(String id) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAirResById",id);
	}
	
	public boolean insertAirDtoToAir(int air_no) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertAirDtoToAir",air_no)!=0?true:false;
	}
	
	public boolean insertAirDtoToRes(AirDTO dto) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertAirDtoToRes",dto)!=0?true:false;
	}
	public AirDTO selectAirByResNo(int Res_no) {
		return sqlMapper.selectOne("selectAirByResNo",Res_no);
	}

	public int CompareTimePlace(String ddate, String departure, String arrival) {
		Map map = new HashMap();
		map.put("ddate", ddate);
		map.put("departure", departure);
		map.put("arrival", arrival);
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("CompareTimePlace",map);
	}

	public List<AirDTO> selectAirDTOByplannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAirDTOByplannerNo", planner_no);
	}
}
