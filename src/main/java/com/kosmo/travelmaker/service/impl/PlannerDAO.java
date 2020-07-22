package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.AccDTO;
import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.PlanDTO;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.ResDTO;

@Repository
public class PlannerDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public boolean insertPlanner(String id) {
		return sqlMapper.insert("insertPlanner",id)==1?true:false;
	}
	public boolean insertCities(Map<String, String> maps) {
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
	public List<PlanDTO> selectPlanDTOByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectPlanDTOByCitiesNo",cities_no );
	}
	public boolean deletePlanByNo(int plan_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deletePlanByNo",plan_no)==1?true:false;
	}
	public boolean deleteCitiesByNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteCitiesByNo", planner_no)==1?true:false;
	}
	public boolean deletePlannerByNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deletePlannerByNo", planner_no)==1?true:false;
	}
	public boolean deletePlanByCitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deletePlanByCitiesNo",cities_no )==1?true:false;
	}
	public boolean deleteCitiesByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteCitiesByPlannerNo",planner_no )==1?true:false;
	}
	public boolean updatePlannerName(Map map) {
		// TODO Auto-generated method stub
		System.out.println("map in dao:"+map);
		return sqlMapper.update("updatePlannerName",map)==1?true:false;
	}
	public List<PlannerDTO> selectPlannerDTOByNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectPlannerDTOByNo",planner_no);
	}
	public PlannerDTO selectPlannerDTOBycitiesNo(int cities_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectPlannerDTOBycitiesNo",cities_no);
	}
	public boolean updateAccNo(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateAccNo",maps)==1?true:false;
	}
	public boolean insertAcc(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertAcc", maps)==1?true:false;
	}
	public int selectAccNoByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectAccNoByPlannerNo",planner_no);
	}
	public List<Integer> selectPlannerNoListById(String user_id) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectPlannerNoListById", user_id);
	}
	public boolean DeleteAcc(Map<String, String> maps) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("DeleteAcc", maps)==1?true:false;
	}
	public boolean deleteAccByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteAccByPlannerNo", planner_no)==1?true:false;
	}
	public List<ResDTO> selectResDTOListByPlannerNo(String user_id) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectResDTOListByPlannerNo", user_id);
	}
	public void insertRes(Map map) {
		System.out.println("insertRes:"+map);
		sqlMapper.insert("insertRes", map);
		
	}
	public void updateRes(String h_a_no) {
		sqlMapper.update("updateRes", h_a_no);
		
	}
	public boolean deleteResByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteResByPlannerNo", planner_no)==1?true:false;
	}
	public boolean deleteResByHotelNo(String h_a_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteResByHotelNo", h_a_no)==1?true:false;
	}
	public boolean deleteResByAirNo(String h_a_no) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteResByAirNo", h_a_no)==1?true:false;
	}
	public List<AccDTO> selectAccNosByPlannerNo(int planner_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectAccNosByPlannerNo", planner_no);
	}
}
