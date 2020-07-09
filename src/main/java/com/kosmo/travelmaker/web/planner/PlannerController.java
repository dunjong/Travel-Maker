package com.kosmo.travelmaker.web.planner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.collection.KeySet;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.SpotsDTO;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;
import com.kosmo.travelmaker.service.impl.SpotsServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class PlannerController {
	@Value("${GoogleMapApiKey}")
	private String GoogleMapApiKey;
	@Value("${SkyscannerAirportAutoCompleteApiKey}")
	private String AutoCompleteApiKey;
	@Value("${TripAdviserHotelApiKey}")
	private String TripAdviserHotelApiKey;
	@Resource(name="spotsService")
	private SpotsServiceImpl spotsService;
	@Resource (name="cityService")
	private CityServiceImpl cityService;
	
	@Resource(name ="plannerService")
	private PlannerServiceImpl plannerService;
	

	@RequestMapping(value = "Planner.kosmo")
	public String Planner(@RequestParam Map map,Model model,HttpSession session) {
		int planner_no=0;
		System.out.println("map.get(\"planner_no\"):"+map.get("planner_no"));
		Map<String,Integer> city_no_name=new HashMap<String, Integer>();
		if(map.get("planner_no")==null) {
			String[] city_no_list=map.get("city_no").toString().split(",");
			if(plannerService.insertPlanner(session.getAttribute("id").toString())) {
				System.out.println("플래너가 저장되었습니다.");
				planner_no=plannerService.selectPlannerNo();
				System.out.println("planner_no:"+planner_no);
				for(String no:city_no_list) {
					Map<String, Integer> maps=new HashMap<String, Integer>();
					maps.put("planner_no", planner_no);
					maps.put("city_no", Integer.parseInt(no));
					if(plannerService.insertCities(maps)) {
						System.out.println(no+" 도시가 저장되었습니다.");
						int cities_no=plannerService.selectCitiesNo();
						city_no_name.put(cityService.selectCityDTO(Integer.parseInt(no)).getCity_name(),cities_no);
					}///if
					
				}///for
			};///if
			
		}///if
		else {
			planner_no=Integer.parseInt(map.get("planner_no").toString());
			for(int no:plannerService.selectPlannerList(Integer.parseInt(map.get("planner_no").toString()))) {
				Map<String, Integer> maps=new HashMap<String, Integer>();
				maps.put("planner_no", planner_no);
				maps.put("city_no", no);
				int cities_no=plannerService.selectCitiesNoByMap(maps);
				city_no_name.put(cityService.selectCityDTO(no).getCity_name(),cities_no);
			}
		}
		
		model.addAttribute("planner_no",planner_no);
		model.addAttribute("city_no_name",city_no_name);
		//String user_id=session.getAttribute("id").toString();
		//cityService.makingplanner(user_id);
		model.addAttribute("TripAdviserHotelApiKey",TripAdviserHotelApiKey);
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("AutoCompleteApiKey",AutoCompleteApiKey);
		return "planner/Planner";
	}
	
	
	@RequestMapping("Plan.kosmo")
	public String Plan(@RequestParam Map map, Model model) {
		String cities_no=map.get("cities_no").toString();
		
		List<Integer> plan_no_list=plannerService.selectPlanNoByCitiesNo(Integer.parseInt(cities_no));
		System.out.println("받아온 cities_no:"+cities_no);
		for(int no:plan_no_list) {
			
			System.out.println("찾아온 plan_no:"+no);
		}
		String city_name=map.get("origin").toString();
		int city_no=cityService.selectCityNo(city_name);
		Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
		for(int i=1;i<=5;i++) {
			List<String> spotIDs=new Vector<String>();
			dayPlan.put("day"+i, spotIDs);
		}
		//model.addAttribute("planner_no",planner_no);
		
		model.addAttribute("planner_no",map.get("planner_no"));
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("dayPlan",dayPlan);
		model.addAttribute("origin",map);
		model.addAttribute("city_no",city_no);
		model.addAttribute("cities_no",cities_no);
		
		return "planner/Plan.tiles";
		
	}
	
	@RequestMapping(value ="PlanSave.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public void PlanSave(@RequestParam Map<String,String> map) {
		System.out.println("map: "+map);
		int planner_no=Integer.parseInt(map.get("planner_no"));
		String city_name=map.get("city_name");
		int city_no=cityService.selectCityNo(city_name);
		
		int cities_no=Integer.parseInt(map.get("cities_no"));
		
		
		for(String date:map.keySet()) {
			String ids="";
			Map<String, Object> maps2=new HashMap<String, Object>();
			if(date.contains("day")) {
				System.out.println("date"+date);
				maps2.put("plan_date", date);
				maps2.put("cities_no", cities_no);
				if(plannerService.insertPlan(maps2)) {
					System.out.println(date+"일차 plan이 저장되었습니다");
					int plan_no=plannerService.selectPlanNo();
					System.out.println("plan_no"+plan_no);
					SpotsDTO dto=new SpotsDTO();
					dto.setPlan_no(plan_no);
					dto.setSpot_name("모름");
					ids=map.get(date).substring(0,map.get(date).length()-1);
					for(String id:ids.split(",")) {
						dto.setSpot_id(id);
						if(spotsService.insertSaveSpot(dto)) {
							System.out.println(date+"일차 plan이"+id+"가 저장되었습니다");
						}
					}
					
				}
				
			}
			
				System.out.println(date+"일차의 id:"+ids);
				//spotsService.insertPlan(date);
				
			
		}
		
		List<String> list=new Vector<String>();
	
		//dto.setCity_no(Integer.parseInt(map.get("city_no").toString()));
		
	}
	
	
	@RequestMapping("CitySearch.kosmo")
	public String CitySearch() {
		return "planner/CitySearch.main";
	}
	@RequestMapping("DayPlanSava.kosmo")
	public String DayPlanSava() {
		return "planner/Plan.tiles";
	}
	
	@RequestMapping(value ="SpotList.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String SpotList(@RequestParam Map map) {
			System.out.println("city_no:"+map.get("city_no"));
			List<SpotsDTO> list=spotsService.spotList(map);
			Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
			for(int i=1;i<=5;i++) {
				List<String> spotIDs=new Vector<String>();
				dayPlan.put("day"+i, spotIDs);
			}
	
			
			for(SpotsDTO dto:list) {
				
				System.out.println("장소명:"+dto.getSpot_name()+",일차:"+dto.getAuto_plan_date());
				String day=dto.getAuto_plan_date();
				switch(day) {
					case "1":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "2":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "3":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "4":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "5":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "6":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "7":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					default:
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
				}
			}
			List<Map> collections = new Vector<Map>();
			collections.add(dayPlan);
			return JSONArray.toJSONString(collections);
		}
	
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	
	
}
