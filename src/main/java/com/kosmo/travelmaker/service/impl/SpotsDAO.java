package com.kosmo.travelmaker.service.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kosmo.travelmaker.service.SpotsDTO;

@Repository
public class SpotsDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	
	public List<SpotsDTO> spotList(Map map) {
		return sqlMapper.selectList("spotListSelectList",map);
	}
	public boolean insertSaveSpot(SpotsDTO dto) {
		System.out.println("DAO의 dto: "+dto.getSpot_id()+","+dto.getSpot_name()+","+dto.getPlan_no());
		return sqlMapper.insert("insertSaveSpot", dto)==1?true:false;
	}

}
