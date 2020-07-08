package com.kosmo.travelmaker.android;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.travelmaker.service.AndroidMemberDTO;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;

@RestController
@RequestMapping("/android")
public class androidController {
	@Resource(name="memberService")
	private MemberServiceImpl service;
	
//	,produces ="text/html; charset=UTF-8"
	@CrossOrigin
	@GetMapping(value="/member/json")
	public AndroidMemberDTO isMemberJsonByGet(AndroidMemberDTO member) {		
		System.out.println(member.toString());
		AndroidMemberDTO dto=service.isLogin(member);
		System.out.println(dto.toString());
		return dto;		
	}

}
