package com.kosmo.travelmaker.web.hotel;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value ="HotelTest.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String HotelTest(@RequestParam Map map) {
		System.out.println("checkIn: "+map.get("checkIn"));
		System.out.println("checkOut: "+map.get("checkOut"));
		System.out.println("name: "+map.get("name"));
		System.out.println("latlng: "+map.get("latlng"));
		System.out.println("price: "+map.get("price"));
		System.out.println("score: "+map.get("score"));
		return "성공!";
	}
}