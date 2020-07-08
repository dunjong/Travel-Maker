package com.kosmo.travelmaker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.impl.MemberDAO;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.MemberService;
import com.kosmo.travelmaker.service.PlannerDTO;
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Resource(name = "memberDAO")
	MemberDAO memberDAO;
	
	@Override
	public boolean isLogin(Map map) {
		return memberDAO.isLogin(map);
	}
	
	public MemberDTO isLogin(MemberDTO dto) {
		return memberDAO.isLogin(dto);
	}
	
	@Override
	public boolean SignUp(MemberDTO dto) {
		return memberDAO.SignUp(dto);
	}
	@Override
	public String idCheck(String id) {
		return memberDAO.idCheck(id)?"failure":"success";
	}
	@Override
	public List<PlannerDTO> plannerList(Map map) {
		return memberDAO.myPlannerList(map);
	}
	public String kakao(String kakaoemail,String kakoid,MemberDTO dto) {
		
		return memberDAO.kakao(dto);
	}
	
	

}
