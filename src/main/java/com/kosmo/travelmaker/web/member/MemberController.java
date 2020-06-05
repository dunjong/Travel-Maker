package com.kosmo.travelmaker.web.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/TravelMaker/")
public class MemberController {

	@RequestMapping("SignIn.kosmo")
	public String SignIn() {
		return "member/SignIn.tiles";
	}
	@RequestMapping("SignUp.kosmo")
	public String SignUp() {
		return "member/SignUp.tiles";
	}
	@RequestMapping("MyInfo.kosmo")
	public String MyInfo() {
		return "member/MyInfo.tiles";
	}
	@RequestMapping("MyInfoEdit.kosmo")
	public String MyInfoEdit() {
		return "member/MyInfoEdit.tiles";
	}
	@RequestMapping("BookMark.kosmo")
	public String BookMark() {
		return "member/BookMark.tiles";
	}
}
