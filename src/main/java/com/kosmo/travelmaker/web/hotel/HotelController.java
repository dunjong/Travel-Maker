package com.kosmo.travelmaker.web.hotel;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/TravelMaker/")
public class HotelController {
	@Value("${TripAdviserHotelApiKey}")
	private String TripAdviserHotelApiKey;
	@RequestMapping("HotelSearch.kosmo")
	public String HotelSearch() {
		return "hotel/HotelSearch.tiles";
	}
	
	@RequestMapping("HotelList.kosmo")
	public String HotelList(Model model) {
		model.addAttribute("TripAdviserHotelApiKey",TripAdviserHotelApiKey);
		return "hotel/HotelList.tiles";
	}
			
	@RequestMapping("HotelView.kosmo")
	public String HotelView() {
		return "hotel/HotelView.tiles";
	}
	@RequestMapping("HotelRes.kosmo")
	public String HotelRes() {
		return "hotel/HotelRes.tiles";
	}
	
}