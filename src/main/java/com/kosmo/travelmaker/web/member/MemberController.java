package com.kosmo.travelmaker.web.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;


@Controller
@RequestMapping("/TravelMaker/")
public class MemberController {
	@Resource(name = "validator")
	private SignUpValidator validator;
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	

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
	
	@RequestMapping("MyPlanner.kosmo")
	public String MyPlanner(@RequestParam Map map,Model model) {
		List<PlannerDTO> list=memberService.plannerList(map);
		List<Map> collections = new Vector<Map>();
		for(PlannerDTO dto:list ) {
			Map<String, String> maps=new HashMap<String, String>();
			String no=Integer.toString(dto.getPlanner_no()) ;
			maps.put(no, no);
			collections.add(maps);
		}
		
		model.addAttribute("lists",JSONArray.toJSONString(collections));
		return "member/MyPlanner.tiles";
	}
	
	@RequestMapping("ValidationCheck.do")
	public String vali(MemberDTO dto,BindingResult errors,Model model) {//formcommand뒤에 bindingresult를 넣어야함
		//내가 만든 validate클래스의 validate()호출 데이터로 cmd넣고 에러정보용으로 errors넣어준다.
		validator.validate(dto, errors);
		if(errors.hasErrors()) {
			model.addAttribute("error","validation");
			return "/home.tiles";
		}
		model.addAttribute("dto",dto);
		return "forward:/TravelMaker/SignUp.do";
	}///vali
	@RequestMapping("SignUp.do")
	public String SignUp(MemberDTO dto, HttpSession session){
		if(memberService.SignUp(dto)) {
			session.setAttribute("id", dto.getId());
		}
		return "/home.tiles";
	}
	@RequestMapping("IdCheck.do")
	@ResponseBody
	public String IdCheck(@RequestParam String signUpId) {
		return memberService.idCheck(signUpId);
	}
	
	/*
	@RequestMapping(value="snsLogin/{userId}", method=RequestMethod.POST)
	public String snsLogin(@PathVariable String userId, HttpSession session ) throws Exception{
	    System.out.println("/user/snsLogin : POST");     
	    //User dbUser = userService.getUser(userId);
	    //session.setAttribute("user", dbUser);
	        
	    return "redirect:/index.jsp";
	}
	*/

}
