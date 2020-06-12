package com.kosmo.travelmaker.web.planner;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/TravelMaker/")
public class PlannerController {

	@RequestMapping("Planner.kosmo")
	public String Planner() {
		return "planner/Planner.tiles";
	}
	@RequestMapping("Plan.kosmo")
	public String Plan() {
		
		
		return "planner/Plan.tiles";
	}
	@RequestMapping("CitySearch.kosmo")
	public String CitySearch() {
		return "planner/CitySearch.tiles";
	}
	@RequestMapping("DayPlanSava.kosmo")
	public String DayPlan(@RequestParam Map map) {
		//map에서 값 가져와서 저장
		
		
		return "planner/Plan.tiles";
	}
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	
	
}
