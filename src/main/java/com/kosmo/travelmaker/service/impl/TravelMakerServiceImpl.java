package com.kosmo.travelmaker.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.travelmaker.service.impl.MemberDAO;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.TravelMakerService;
@Service("travelMakerService")
public class TravelMakerServiceImpl implements TravelMakerService{
	@Resource(name = "memberDAO")
	MemberDAO memberDAO;
	
	@Override
	public boolean isLogin(Map map) {
		return memberDAO.isLogin(map);
	}
	@Override
	public boolean SignUp(MemberDTO dto) {
		return memberDAO.SignUp(dto);
	}
	@Override
	public String idCheck(String id) {
		return memberDAO.idCheck(id)?"failure":"success";
	}
	

}
