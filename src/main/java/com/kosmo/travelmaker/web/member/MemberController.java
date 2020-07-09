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
import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.CityDTO;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;
import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;


@Controller
@RequestMapping("/TravelMaker/")
public class MemberController {
	@Resource(name = "validator")
	private SignUpValidator validator;
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	@Resource(name="plannerService")
	private PlannerServiceImpl plannerService;
	@Resource(name="cityService")
	private CityServiceImpl cityService;
	

	@RequestMapping("MyInfo.kosmo")
	public String MyInfo(@RequestParam Map map, HttpSession session,Model model) {
		MemberDTO dto = memberService.selectMemberDTO(session.getAttribute("id").toString());
		model.addAttribute("id",dto.getUser_id());
		model.addAttribute("name",dto.getUser_name());
		model.addAttribute("pwd",dto.getUser_pwd());
		model.addAttribute("gender",dto.getUser_gender());
		model.addAttribute("rrn",dto.getUser_rrn());
		return "member/MyInfo.tiles";
	}
	@RequestMapping("MyInfoEdit.kosmo")
	public String MyInfoEdit(@RequestParam Map map, HttpSession session) {

		if(memberService.updateMemberDTO(map)) {
			
			System.out.println(map.get("updateColumn").toString()+"수정이 완료되었습니다");
		}
		
		return "member/MyInfoEdit.tiles";
	}
	@RequestMapping("BookMark.kosmo")
	public String BookMark() {
		return "member/BookMark.tiles";
	}
	
	@RequestMapping(value="MyPlannerDetails.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String MyPlannerDetails(@RequestParam Map map) {
		int planner_no=Integer.parseInt(map.get("planner_no").toString());


		List<Map> collections = new Vector<Map>();
		List<CitiesDTO> list_cities=cityService.selectCitiesDTO(planner_no);
		for(CitiesDTO dto_cities:list_cities) {
			Map<String, String> maps_cities=new HashMap<String, String>();
			int cities_no=dto_cities.getCities_no();
			int city_no=dto_cities.getCity_no();
			CityDTO dto_city= cityService.selectCityDTO(city_no);
			maps_cities.put("img", dto_city.getCity_img());
			maps_cities.put("name", dto_city.getCity_name());
			maps_cities.put("intro", dto_city.getCity_intro());
			maps_cities.put("cities_no",Integer.toString(cities_no));
			maps_cities.put("planner_no", Integer.toString(planner_no));
			maps_cities.put("city_no",Integer.toString(city_no));
			collections.add(maps_cities);
		}
		
		return JSONArray.toJSONString(collections);
	}
	
	
	@RequestMapping("MyPlanner.kosmo")
	public String MyPlanner(@RequestParam Map map,Model model,HttpSession session) {
		List<PlannerDTO> list_planner=memberService.plannerList(session.getAttribute("id").toString());
		List<Map> collections_planner = new Vector<Map>();
		List<Map> collections_cities = new Vector<Map>();
		List<Map<String, Integer>> list=new Vector<Map<String,Integer>>();
		
		for(PlannerDTO dto_planner:list_planner) {
			Map<String ,Integer> maps=new HashMap<String, Integer>();
			maps.put("planner_no", dto_planner.getPlanner_no());
			maps.put("planner_acc", dto_planner.getPlanner_acc());
			list.add(maps);
		}
		model.addAttribute("list", list);
		
//		for(PlannerDTO dto_planner:list_planner) {
//			Map<String, String> map_planner=new HashMap<String, String>();
//			int planner_no=dto_planner.getPlanner_no();
//			int planner_acc=dto_planner.getPlanner_acc();
//			map_planner.put("planner_no", Integer.toString(planner_no));
//			map_planner.put("planner_acc", Integer.toString(planner_acc));
//			collections_planner.add(map_planner);
//			List<CitiesDTO> list_cities=cityService.selectCitiesDTO(planner_no);
//			for(CitiesDTO dto_cities:list_cities) {
//				Map<String, String> maps_cities=new HashMap<String, String>();
//				int city_no=dto_cities.getCity_no();
//				CityDTO dto_city= cityService.selectCityDTO(city_no);
//				maps_cities.put("planner_no", Integer.toString(planner_no));
//				maps_cities.put("img", dto_city.getCity_img());
//				maps_cities.put("name", dto_city.getCity_name());
//				maps_cities.put("intro", dto_city.getCity_intro());
//				collections_cities.add(maps_cities);
//			}
//		}
//		
//		model.addAttribute("lists_planner",JSONArray.toJSONString(collections_planner));
//		model.addAttribute("lists_cities",JSONArray.toJSONString(collections_cities));
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
			session.setAttribute("id", dto.getUser_id());
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
