package com.kosmo.travelmaker.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	public boolean deleteHotelByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteHotelByCitiesNo", cities_no)==1?true:false;
	}
	
}
