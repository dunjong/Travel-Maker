package com.kosmo.travelmaker.web.planner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travelmaker.service.SpotsDTO;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
import com.kosmo.travelmaker.service.impl.SpotsServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class PlannerController {
	@Value("${GoogleMapApiKey}")
	private String GoogleMapApiKey;
	@Resource(name="spotsService")
	private SpotsServiceImpl spotsService;
	@Resource (name="cityService")
	private CityServiceImpl cityService;
	
	
	@RequestMapping("Planner.kosmo")
	public String Planner(@RequestParam Map map,Model model) {
		
		List<String> city_no_name=new Vector<String>();
		String[] city_no_list=map.get("city_no").toString().split(",");
		for(String no:city_no_list) {
			city_no_name.add(cityService.selectCityDTO(Integer.parseInt(no)).getCity_name());
		}
		
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("city_no_name",city_no_name);
		return "planner/Planner.tiles";
	}
	
	@RequestMapping("Plan.kosmo")
	public String Plan( Model model) {
		
		Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
		for(int i=1;i<=5;i++) {
			List<String> spotIDs=new Vector<String>();
			dayPlan.put("day"+i, spotIDs);
		}
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("dayPlan",dayPlan);
		return "planner/Plan.tiles";
	}
	@RequestMapping("CitySearch.kosmo")
	public String CitySearch() {
		return "planner/CitySearch.main";
	}
	@RequestMapping("DayPlanSava.kosmo")
	public String DayPlanSava() {
		return "planner/Plan.tiles";
	}
	@RequestMapping("SpotList.kosmo")
	public String SpotList(Model model,@RequestParam Map map) {
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
					dayPlan.get("day"+day).add("'"+dto.getSpot_id().toString()+"'");
					break;
				case "2":
					dayPlan.get("day"+day).add("'"+dto.getSpot_id().toString()+"'");
					break;
				case "3":
					dayPlan.get("day"+day).add("'"+dto.getSpot_id().toString()+"'");
					break;
				case "4":
					dayPlan.get("day"+day).add("'"+dto.getSpot_id().toString()+"'");
					break;
				default:
					dayPlan.get("day"+day).add("'"+dto.getSpot_id().toString()+"'");
			}
		}
		model.addAttribute("dayPlan",dayPlan);
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		
		return "planner/Plan.tiles";
	}
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	
	
}
