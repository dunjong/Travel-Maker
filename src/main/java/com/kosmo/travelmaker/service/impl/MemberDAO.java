package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.travelmaker.service.AndroidMemberDTO;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.PlannerDTO;

@Repository
public class MemberDAO {
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("isLogin",map)==0 ? false : true;
	}
	
	public AndroidMemberDTO isLogin(AndroidMemberDTO dto) {
		return sqlMapper.selectOne("androidLogin",dto);
	}
	public boolean SignUp(MemberDTO dto) {
		return sqlMapper.insert("signUp",dto)==0 ? false : true;
	}
	public boolean idCheck(String id) {
		return (Integer)sqlMapper.selectOne("idCheck",id)==0 ? false : true;
	}
	public List<PlannerDTO> myPlannerList(String id) {
		
		return sqlMapper.selectList("myPlannerListSelectList",id);
	}
	public String kakao(MemberDTO dto) {
		 
		return null;
	}

	public int registerInsert(AndroidMemberDTO member) {
		
		return sqlMapper.insert("registerInsert",member);
	}
	public MemberDTO selectMemberDTO(String id) {
		// TODO Auto-generated method stub
		System.out.println("id of dao: "+id);
		return sqlMapper.selectOne("selectMemberDTO",id);
	}

	public boolean updateMemberDTO(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateMemberDTO", map)==1?true:false;
	}
	public MemberDTO selectMember(String id) {
		return sqlMapper.selectOne("selectMember",id);
	}
}
