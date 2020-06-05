package com.kosmo.travelmaker.web.air;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/TravelMaker/")
public class AirController {

	@RequestMapping("AirSearch.kosmo")
	public String AirSearch() {
		return "air/AirSearch.tiles";
	}
	
	@RequestMapping("AirList.kosmo")
	public String AirList() {
		return "air/AirList.tiles";
	}
			
	@RequestMapping("AirView.kosmo")
	public String AirView() {
		return "air/AirView.tiles";
	}
	@RequestMapping("AirRes.kosmo")
	public String AirRes() {
		return "air/AirRes.tiles";
	}
}
