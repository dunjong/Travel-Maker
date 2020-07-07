package com.kosmo.travelmaker;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;

//스프링 4.x이후 추가됨:@Controller + @ResponseBody
//아래 어노테이션을 쓰면 바로 브라우저로 응답:@ResponseBody 필요 없다
/*
 * 스프링 씨큐리티 사용시 CSRF공격 설정시
 * POST로 요청시에는 반드시 _csrf값을 전송
 * GET으로 요청시에는  _csrf값을 전송 불필요
 */
@Controller
public class RestApiController {
	
	

	@Resource(name="memberService")
	private MemberServiceImpl service;
	
	//안드로이드 앱에 데이타 제공용
	//일반 텍스트로 제공시
	/*
	 * @GetMapping(value="/member",produces = "text/plain; charset=UTF-8") public
	 * String isMemberTextGet(@RequestParam Map map) { boolean
	 * isMember=service.isLogin(map); return isMember ? "회원입니다":"회원이 아닙니다"; }
	 * 
	 * @PostMapping(value="/member",produces = "text/plain; charset=UTF-8") public
	 * String isMemberTextPost(@RequestParam Map map) { boolean
	 * isMember=service.isLogin(map); return isMember ? "회원입니다":"회원이 아닙니다"; }
	 */
	//JSON으로 제공시
	@ResponseBody
	@RequestMapping(value="/member/json",produces ="text/html; charset=UTF-8")
	public MemberDTO isMemberJsonByGet(MemberDTO member) {		
		System.out.println(member.toString());
		return service.isLogin(member);		
	}
	
}
