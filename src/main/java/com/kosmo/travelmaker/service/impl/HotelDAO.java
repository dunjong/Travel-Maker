package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.HotelDTO;

@Repository
public class HotelDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	public boolean deleteHotelByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteHotelByCitiesNo", cities_no)==1?true:false;
	}

	public boolean insertHotelByMap(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertHotelByMap", map)==1?true:false;
	}

	public List<HotelDTO> selectHotelDTOByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectHotelDTOByCitiesNo",cities_no );
	}

	public boolean updateHotelInfo(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateHotelInfo", map)==1?true:false;
	}

	public HotelDTO selectHotelDTO(int hotel_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectHotelDTO",hotel_no);
	}
	public int selectHotelNo() {
		return sqlMapper.selectOne("selectHotelNo");
	}
	
}
