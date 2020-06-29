package com.kosmo.travelmaker.web.planner;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.api.client.util.Value;
import com.kosmo.travelmaker.service.SpotsDTO;
import com.kosmo.travelmaker.service.impl.SpotsServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class PlannerController {
	@Value("${GoogleMapApiKey}")
	private String GoogleMapApiKey;
	@Resource(name="spotsService")
	private SpotsServiceImpl spotsService;
	
	@RequestMapping("Planner.kosmo")
	public String Planner(Model model) {
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		return "planner/Planner.tiles";
	}
	@RequestMapping("Plan.kosmo")
	public String Plan(Model model) {
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		
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
		List<String> spotIDs=new Vector<String>();
		for(SpotsDTO dto:list) {
			spotIDs.add("'"+dto.getSpot_id().toString()+"'");
		}
		model.addAttribute("spotIDs",spotIDs);
		
		return "planner/Plan.tiles";
	}
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	
	
}
