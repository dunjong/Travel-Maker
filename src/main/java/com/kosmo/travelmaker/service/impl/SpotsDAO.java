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
		return sqlMapper.insert("insertSaveSpot", dto)==1?true:false;
	}
	public List<SpotsDTO> selectSpotDTOList(int plan_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectSpotDTOList",plan_no);
	}
	public List<SpotsDTO> spotListByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("spotListByCitiesNo", cities_no);
	}
	public boolean deleteSpotByPlanNo(int plan_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteSpotByPlanNo",plan_no)==1?true:false;
	}
	public String selectPlanDateByNo(int plan_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectPlanDateByNo",plan_no);
	}
	public List<Integer> selectPlanNoListByDayNCity(Map<String, Integer> maps) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectPlanNoListByDayNCity", maps);
	}

}
