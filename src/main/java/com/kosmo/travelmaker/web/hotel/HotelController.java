package com.kosmo.travelmaker.web.hotel;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.travelmaker.service.HotelDTO;
import com.kosmo.travelmaker.service.impl.HotelServiceImpl;
import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class HotelController {
	@Value("${TripAdviserHotelApiKey}")
	private String TripAdviserHotelApiKey;
	
	@Resource(name="hotelService")
	private HotelServiceImpl hotelService;
	
	@Resource(name ="plannerService")
	private PlannerServiceImpl plannerService;
	
	
	
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
		String flag= "실패";
		if(hotelService.insertHotelByMap(map)) {
			flag="성공!";
		}
		String hotel_name=map.get("hotel_name").toString();
		String hotel_city=map.get("hotel_city").toString();
		String hotel_in=map.get("hotel_in").toString();
		String hotel_out=map.get("hotel_out").toString();
		String hotel_customer=map.get("hotel_customer").toString();
		String hotel_room=map.get("hotel_room").toString();
		String hotel_price=map.get("hotel_price").toString();
		String hotel_latlng=map.get("hotel_latlng").toString();
		String hotel_score=map.get("hotel_score").toString();
		String cities_no=map.get("cities_no").toString();
		
		
		
		System.out.println("hotel_name: "+hotel_name);
		System.out.println("hotel_city: "+hotel_city);
		System.out.println("hotel_in: "+hotel_in);
		System.out.println("hotel_out: "+hotel_out);
		System.out.println("hotel_customer: "+hotel_customer);
		System.out.println("hotel_room: "+hotel_room);
		System.out.println("hotel_price: "+hotel_price);
		System.out.println("hotel_latlng: "+hotel_latlng);
		System.out.println("hotel_score: "+hotel_score);
		System.out.println("cities_no: "+cities_no);
		
		
		
		return flag;
	}
}