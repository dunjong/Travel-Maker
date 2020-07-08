package com.kosmo.travelmaker.android;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;

@Controller
public class androidController {
	@Resource(name="memberService")
	private MemberServiceImpl service;
	
	@ResponseBody
	@RequestMapping(value="/member/json",produces ="text/html; charset=UTF-8")
	public MemberDTO isMemberJsonByGet(MemberDTO member) {		
		System.out.println(member.toString());
		return service.isLogin(member);		
	}
}
