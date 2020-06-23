package com.kosmo.travelmaker.service;

import java.util.Map;

public interface TravelMakerService {
	//로그인 용]
	boolean isLogin(Map map);
	boolean SignUp(MemberDTO dto);
	String idCheck(String id);
}

