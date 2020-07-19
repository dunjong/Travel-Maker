package com.kosmo.travelmaker.service.impl;

import java.util.List;

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
}
