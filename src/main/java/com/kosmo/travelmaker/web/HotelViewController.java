package com.kosmo.travelmaker.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HotelViewController {

	@RequestMapping("/TravelMaker/hotelview.kosmo")
	public String hotelView() {
		return "hotel/HotelMain.tiles";
	}
	
}
