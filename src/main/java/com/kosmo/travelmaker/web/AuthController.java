package com.kosmo.travelmaker.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.travelmaker.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class AuthController {
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@RequestMapping("LoginProcess.do")
	public String process(HttpSession session,@RequestParam Map map,Model model) {
		//서비스 호출]
		boolean flag=memberService.isLogin(map);
		if(flag) {//회원
			//세션 영역에 데이타 저장
			session.setAttribute("id",map.get("user_id"));
		}
		else//비회원이거나 아이디가 틀린경우
			model.addAttribute("NotMember", "아이디와 비밀번호를 찾지 못했습니다");
		return "/home.tiles";	
	}////////process
	
	//로그아웃 처리]
	@RequestMapping("Logout.do")
	public String logout(HttpSession session) {
		//로그아웃 처리-세션영역 데이타 삭제
		session.invalidate();
		return "redirect:/";	
	}//////////logout
	
}
