package com.kosmo.travelmaker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AirDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	public boolean deleteResByCitiesNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteResByCitiesNo", planner_no)==1?true:false;
	}

	public List<Integer> selectAirResNoByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAirResNoByPlannerNo", planner_no);
	}
}
