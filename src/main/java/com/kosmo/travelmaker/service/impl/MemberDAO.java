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

	public boolean updateMemberDTO(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateMemberDTO", dto)==1?true:false;
	}
	public MemberDTO selectMember(String id) {
		return sqlMapper.selectOne("selectMember",id);
	}
	public List<MemberDTO> selectMemberList(){
		return sqlMapper.selectList("selectMemberList");
	}

	public int checkAccByNo(int acc_no) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("checkAccByNo", acc_no);
	}

	public void updateAccYes(int acc_no) {
		// TODO Auto-generated method stub
		sqlMapper.update("updateAccYes", acc_no);
	}
	public void updateAccNo(int acc_no) {
		System.out.println("acc_no:"+acc_no);
		sqlMapper.update("updateAccAllowNo", acc_no);
	}

	public void updateUserInfoIdNo(Map<String, String> maps) {
		// TODO Auto-generated method stub
		sqlMapper.update("updateUserInfoIdNo", maps);
	}
}
