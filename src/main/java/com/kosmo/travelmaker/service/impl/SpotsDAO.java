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

}
