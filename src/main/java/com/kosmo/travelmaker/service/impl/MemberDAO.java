package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.PlannerDTO;

@Repository
public class MemberDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("isLogin",map)==0 ? false : true;
	}
	public boolean SignUp(MemberDTO dto) {
		return sqlMapper.insert("signUp",dto)==0 ? false : true;
	}
	public boolean idCheck(String id) {
		return (Integer)sqlMapper.selectOne("idCheck",id)==0 ? false : true;
	}
	public List<PlannerDTO> myPlannerList(Map map) {
		
		return sqlMapper.selectList("myPlannerListSelectList",map);
	}
	public String kakao(MemberDTO dto) {
		 
		return null;
	}
}
