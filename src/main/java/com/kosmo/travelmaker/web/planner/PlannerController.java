package com.kosmo.travelmaker.web.planner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/TravelMaker/")
public class PlannerController {

	@RequestMapping("MyPlanner.kosmo")
	public String Myplanner() {
		return "planner/MyPlanner.tiles";
	}
	@RequestMapping("TouristMain.kosmo")
	public String TouristMain() {
		return "planner/TouristMain.tiles";
	}
	@RequestMapping("TouristList.kosmo")
	public String TouristList() {
		return "planner/TouristList.tiles";
	}
	@RequestMapping("TouristMap.kosmo")
	public String TouristMap() {
		return "planner/TouristMap.tiles";
	}
	@RequestMapping("SpotList.kosmo")
	public String SpotList() {
		return "planner/SpotList.tiles";
	}
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	@RequestMapping("RestaurantList.kosmo")
	public String RestaurantList() {
		return "planner/RestaurantList.tiles";
	}
	@RequestMapping("RestaurantView.kosmo")
	public String RestaurantView() {
		return "planner/RestaurantView.tiles";
	}
	
}
