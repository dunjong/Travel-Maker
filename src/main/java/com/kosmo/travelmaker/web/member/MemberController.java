package com.kosmo.travelmaker.web.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/TravelMaker/")
public class MemberController {


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
	@Resource(name = "validator")
	private SignUpValidator validator;
	@RequestMapping("ValidationCheck.do")
	public String vali(SignUpCommand cmd,BindingResult errors,Model model) {//formcommand뒤에 bindingresult를 넣어야함
		//내가 만든 validate클래스의 validate()호출 데이터로 cmd넣고 에러정보용으로 errors넣어준다.
		validator.validate(cmd, errors);
		if(errors.hasErrors()) {
			return "/home.tiles";
		}
		model.addAttribute("cmd",cmd);
		return "/Validation10/ValidationComplete.jsp";
	}///vali
}
