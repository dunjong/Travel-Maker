package com.kosmo.travelmaker.web.planner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping("SpotList.kosmo")
	public String SpotList() {
		return "planner/SpotList.tiles";
	}
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	
	
}
