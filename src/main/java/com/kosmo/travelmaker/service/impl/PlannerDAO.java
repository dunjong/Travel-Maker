package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.PlannerDTO;

@Repository
public class PlannerDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public boolean insertPlanner(String id) {
		return sqlMapper.insert("insertPlanner",id)==1?true:false;
	}
	public boolean insertCities(Map<String, Integer> maps) {
		return sqlMapper.insert("insertCities",maps)==1?true:false;
	}
	public List<Integer> selectPlannerList(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectPlannerList",planner_no);
	}
	public int selectPlannerNo() {
		return sqlMapper.selectOne("selectPlannerNo");
	}
	public List<CitiesDTO> selectCitiesDTOList(int planner_no) {
		return sqlMapper.selectList("selectCitiesDTOList",planner_no);
	}
	public int selectCitiesNo() {
		return sqlMapper.selectOne("selectCitiesNo");
	}
	public boolean insertPlan(Map<String, Object> maps2) {
		return sqlMapper.insert("insertPlan", maps2)==1?true:false;
	}
	public int selectPlanNo() {
		return sqlMapper.selectOne("selectPlanNo");
	}
	public int selectCitiesNoByMap(Map<String, Integer> maps) {
		return sqlMapper.selectOne("selectCitiesNoByMap", maps);
	}
	public List<Integer> selectPlanNoByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectPlanNoByCitiesNo",cities_no);
	}
	public List<PlannerDTO> selectPlanDTOByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectPlanDTOByCitiesNo",cities_no );
	}
	public boolean deletePlanByNo(int plan_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deletePlanByNo",plan_no)==1?true:false;
	}
}
