package com.kosmo.travelmaker.web.hotel;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.travelmaker.service.CityService;
import com.kosmo.travelmaker.service.HotelDTO;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
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
	
	@Resource(name ="cityService")
	private CityServiceImpl cityService;
	
	
	
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
		String city_name= map.get("city_name").toString();
		int cities_no=Integer.parseInt((String) map.get("cities_no"));
		
		List<HotelDTO> hotel_dto_list= hotelService.selectHotelDTOByCitiesNo(cities_no);
		if(hotel_dto_list.size()==0) {
			if(hotelService.insertHotelByMap(map)) {
				city_name+=":예약 성공!";
			}
		}
		else {
			if(hotelService.updateHotelInfo(map)) {
				city_name+=":호텔 예약이 변경 되었습니다.";
			};
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
		
		
		
		return city_name;
	}
}