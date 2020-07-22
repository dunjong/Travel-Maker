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
import com.kosmo.travelmaker.service.AccDTO;
import com.kosmo.travelmaker.service.AirDTO;
import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.CityDTO;
import com.kosmo.travelmaker.service.HotelDTO;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.ResDTO;
import com.kosmo.travelmaker.service.impl.AirServiceImpl;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
import com.kosmo.travelmaker.service.impl.HotelServiceImpl;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;
import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;
import com.kosmo.travelmaker.service.impl.SpotsServiceImpl;


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
	@Resource(name="spotsService")
	private SpotsServiceImpl spotsService;
	@Resource(name="hotelService")
	private HotelServiceImpl hotelService;
	@Resource(name="airService")
	private AirServiceImpl airService;
	

	
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
			String cities_date=dto_cities.getCities_date();
			CityDTO dto_city= cityService.selectCityDTO(city_no);
			maps_cities.put("img", dto_city.getCity_img());
			maps_cities.put("name", dto_city.getCity_name());
			maps_cities.put("intro", dto_city.getCity_intro());
			maps_cities.put("cities_no",Integer.toString(cities_no));
			maps_cities.put("planner_no", Integer.toString(planner_no));
			maps_cities.put("city_no",Integer.toString(city_no));
			if(cities_date!=null) {
				maps_cities.put("cities_date", cities_date.split(",")[0]+"~"+cities_date.split(",")[1]);
			}
			else {
				maps_cities.put("cities_date", "정해진 일정이 없습니다");
			}
			collections.add(maps_cities);
		}
		
		return JSONArray.toJSONString(collections);
	}
	
	
	@RequestMapping(value="MyPlannerDelete.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String MyPlannerDelete(@RequestParam Map map) {
		int planner_no=Integer.parseInt(map.get("planner_no").toString());
		List<CitiesDTO> cities_dto_list= plannerService.selectCitiesDTOList(planner_no);
		for(CitiesDTO cities_dto:cities_dto_list) {
			int cities_no=cities_dto.getCities_no();
			List<HotelDTO> hotel_dto_list= hotelService.selectHotelDTOByCitiesNo(cities_no);
			System.out.println("cities_no: "+cities_no);
			List<Integer> plan_no_list=plannerService.selectPlanNoByCitiesNo(cities_no);
			for(int plan_no:plan_no_list ){
				System.out.println("plan_no: "+plan_no);
				if(spotsService.deleteSpotByPlanNo(plan_no)) {
					System.out.println("spot들 삭제 완료");
					
				};
			}
			if(plannerService.deletePlanByCitiesNo(cities_no)){
				System.out.println("plan들 삭제 완료");
				
			};
			if(hotel_dto_list.size()!=0) {
				
				int hotel_no=hotel_dto_list.get(0).getHotel_no();
				if(plannerService.deleteResByHotelNo("h_"+hotel_no)) {
					System.out.println("res_h 삭제 완료");
				}
				if(hotelService.deleteHotelByCitiesNo(cities_no)){
					System.out.println("호텔들 삭제 완료");
				};
			}
		}
		if(plannerService.deleteCitiesByPlannerNo(planner_no)) {
			System.out.println("Cities들 삭제 완료");
			
		};
		if(plannerService.deleteAccByPlannerNo(planner_no)) {
			System.out.println("Accompany들 삭제 완료");
		}
		List<AirDTO> air_dto_list=airService.selectAirDTOByplannerNo(planner_no);
		for(AirDTO air_dto:air_dto_list) {
			System.out.println("air_no:"+air_dto.getAir_no());
			if(plannerService.deleteResByAirNo("a_"+air_dto.getAir_no())) {
				System.out.println("AirRes들 삭제 완료");
			};
		}
		if(airService.deleteAirByPlannerNo(planner_no)) {
			System.out.println("Air들 삭제 완료");
		}
		
		
		if(plannerService.deletePlannerByNo(planner_no)) {
			System.out.println("planner 삭제 완료");
		}
		
		
		
		return "삭제 성공";
	}
	//변경됨
	@RequestMapping("MyPlanner.kosmo")
	public String MyPlanner(@RequestParam Map map,Model model,HttpSession session) {
		List<PlannerDTO> list_planner=memberService.plannerList(session.getAttribute("id").toString());
	      List<Map<String, String>> list=new Vector<Map<String,String>>();
	      
	      for(PlannerDTO dto_planner:list_planner) {
	         Map<String ,String> maps=new HashMap<String, String>();
	         int planner_no=dto_planner.getPlanner_no();
	         maps.put("planner_no", Integer.toString(planner_no));
	         maps.put("planner_acc",  Integer.toString(dto_planner.getPlanner_acc()));
	         maps.put("planner_name", dto_planner.getPlanner_name());
	         int allowedCount=memberService.selectAllowedByPlannerNo(planner_no);
	         maps.put("planner_allow",Integer.toString(allowedCount));
	         list.add(maps);
	      }
	      model.addAttribute("list", list);
		return "member/MyPlanner.tiles";
	}
	
	@RequestMapping(value="PayFees.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String PayFees(@RequestParam Map map,HttpSession session,Model model) {
		int planner_no=Integer.parseInt(map.get("planner_no").toString());
		String user_id=session.getAttribute("id").toString();
	    List<ResDTO> res_dto_list=plannerService.selectResDTOListByPlannerNo(user_id);
	    
	    List<Map> collections = new Vector<Map>();
	   
	   
	    for(ResDTO res_dto:res_dto_list) {
	    	if(res_dto.getH_a_no().contains("a_")) {
	    		Map<String, String> map_a=new HashMap<String,String>();
	    		System.out.println("항공측:"+res_dto.getH_a_no());
	    		AirDTO air_dto=airService.selectAirDTO(Integer.parseInt(res_dto.getH_a_no().substring(2)));
	    		if(air_dto.getPlanner_no()==planner_no) {
		    		map_a.put("air_no",Integer.toString(air_dto.getAir_no()));
		    		map_a.put("air_price", air_dto.getAir_price());
		    		map_a.put("air_arr", air_dto.getAir_arr());
		    		map_a.put("air_dep", air_dto.getAir_dep());
		    		map_a.put("air_ddate", air_dto.getAir_ddate());
		    		System.out.println("OK?:"+res_dto.getRes_ok());
		    		if(res_dto.getRes_ok()==1) {
		    			map_a.put("paid","yes");
		    		}
		    		collections.add(map_a);
	    		}
	    	}///air res
	    	else if(res_dto.getH_a_no().contains("h_")){
	    		 Map<String, String> map_h=new HashMap<String,String>();
	    		System.out.println("호텔측:"+res_dto.getUser_id());
	    		System.out.println("호텔측:"+res_dto.getH_a_no());
	    		int hotel_no=Integer.parseInt(res_dto.getH_a_no().substring(2));
	    		System.out.println("호텔측:"+hotel_no);
	    		HotelDTO hotel_dto=hotelService.selectHotelDTO(hotel_no);
	    		if(planner_no==plannerService.selectOnePlannerNoByCitiesNo(hotel_dto.getCities_no())) {
		    		System.out.println("hotel_no:"+hotel_dto.getHotel_no());
		    		map_h.put("hotel_no", Integer.toString(hotel_dto.getHotel_no()));
		    		map_h.put("hotel_price", hotel_dto.getHotel_price());
		    		map_h.put("hotel_name", hotel_dto.getHotel_name());
		    		map_h.put("hotel_in", hotel_dto.getHotel_in());
		    		map_h.put("hotel_out", hotel_dto.getHotel_out());
		    		System.out.println("OK?:"+res_dto.getRes_ok());
		    		if(res_dto.getRes_ok()==1) {
		    			map_h.put("paid","yes");
		    		}
		    		collections.add(map_h);
	    		
	    		};
	    	}
	    }
	    
		
		
	    return JSONArray.toJSONString(collections);
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
	@RequestMapping("MyInfo.kosmo")
	public String MyInfo(@RequestParam Map map, HttpSession session,Model model) {
		MemberDTO dto = memberService.selectMemberDTO(session.getAttribute("id").toString());
		model.addAttribute("user_id",dto.getUser_id());
		model.addAttribute("user_name",dto.getUser_name());
		model.addAttribute("user_gender",dto.getUser_gender());
		model.addAttribute("user_rrn",dto.getUser_rrn());
		return "member/MyInfo.tiles";
	}
	@RequestMapping(value="ValidationCheck2.do")
	public String valiE(MemberDTO dto,BindingResult errors,Model model) {//formcommand뒤에 bindingresult를 넣어야함
		//내가 만든 validate클래스의 validate()호출 데이터로 cmd넣고 에러정보용으로 errors넣어준다.
		validator.validate(dto, errors);
		if(errors.hasErrors()) {
			model.addAttribute("error2","validation");
			return "forward:/TravelMaker/MyInfo.kosmo";
		}
		model.addAttribute("dto",dto);
		return "forward:/TravelMaker/MyInfoEdit.kosmo";
	}///vali
	@RequestMapping("MyInfoEdit.kosmo")
	public String MyInfoEdit(MemberDTO dto) {
		if(memberService.updateMemberDTO(dto)) {
			System.out.println("수정이 완료 되었습니다");
		}
		return "forward:/TravelMaker/MyInfo.kosmo";
	}
	@RequestMapping(value="MyPlannerAccUpdate.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String MyPlannerAccUpdate(@RequestParam Map map) {
		List<Map> collections = new Vector<Map>();
		int planner_no=Integer.parseInt(map.get("planner_no").toString());
		List<AccDTO> acc_dto_list=plannerService.selectAccNosByPlannerNo(planner_no);
		 for(AccDTO acc_dto:acc_dto_list) {
				 Map<String,String> map_mem =new HashMap<String,String>();
				 String user_id=acc_dto.getUser_id();
				 MemberDTO mem_dto=memberService.selectMemberDTO(user_id);
				 map_mem.put("allow", Integer.toString(acc_dto.getAllow()));
				 map_mem.put("acc_no", Integer.toString(acc_dto.getAcc_no()));
				 map_mem.put("user_id", mem_dto.getUser_id());
				 map_mem.put("user_name", mem_dto.getUser_name());
				 map_mem.put("user_gender", mem_dto.getUser_gender());
				 map_mem.put("user_rrn", mem_dto.getUser_rrn());
				 collections.add(map_mem);
		 }
		
		
		 return JSONArray.toJSONString(collections);
	}
	
	
	@RequestMapping(value="UpdateAcc.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String UpdateAcc(@RequestParam Map map) {
		int acc_no=Integer.parseInt(map.get("acc_no").toString());
		String flag="실패";
		if(memberService.checkAccByNo(acc_no)==0) {
			memberService.updateAccYes(acc_no);
			flag="수락";
		}
		else{
			memberService.updateAccNo(acc_no);
			flag="거부";
		};
		 return flag;
	}
	
	@RequestMapping(value="getAirOrHotel.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String getAirOrHotel(@RequestParam Map map,HttpSession session) {
		List<Map> collections = new Vector<Map>();
		String user_id=session.getAttribute("id").toString();
		Map<String, String> maps=new HashMap<String,String>();
		maps.put("user_id", user_id);
		if(map.get("h_a_no").toString().contains("h_")) {
			int hotel_no=Integer.parseInt(map.get("h_a_no").toString().substring(2));
			HotelDTO hotel_dto= hotelService.selectHotelDTO(hotel_no);
			maps.put("price", hotel_dto.getHotel_price().split("-")[1].substring(2));
			maps.put("h_a_no",map.get("h_a_no").toString());
			maps.put("name", hotel_dto.getHotel_name());
			collections.add(maps);
		}
		else {
			int air_no=Integer.parseInt(map.get("h_a_no").toString().substring(2));
			AirDTO air_dto=airService.selectAirDTO(air_no);
			maps.put("price", air_dto.getAir_price());
			maps.put("h_a_no",map.get("h_a_no").toString());
			maps.put("name", air_dto.getAir_dep()+"->"+air_dto.getAir_arr()+":"+air_dto.getAir_ddate());
			collections.add(maps);
		}
		
		return JSONArray.toJSONString(collections);
	}
	
	
	@RequestMapping(value="updateResOk.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String updateResOk(@RequestParam Map map) {
		String flag="결제 실패";
		String h_a_no=map.get("h_a_no").toString();
		System.out.println("updateResOk:h_a_no"+h_a_no);
		if(plannerService.updateResOk(h_a_no)) {
			flag= "결제 완료";
		};
		return flag;
	}
	
//	@RequestMapping("admin2.kosmo")
//	public String memberList(Map map, Model model) {
//		MemberDTO dto = memberService.selectMember(map);
//		
//	}
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
