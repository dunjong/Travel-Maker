package com.kosmo.travelmaker.web.hotel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
	public String HotelTest(@RequestParam Map map,HttpSession session) {
		String city_name= map.get("city_name").toString();
		int cities_no=Integer.parseInt((String) map.get("cities_no"));
		
		List<HotelDTO> hotel_dto_list= hotelService.selectHotelDTOByCitiesNo(cities_no);
		if(hotel_dto_list.size()==0) {
			if(hotelService.insertHotelByMap(map)) {
				hotel_dto_list= hotelService.selectHotelDTOByCitiesNo(cities_no);
				city_name+=":예약 성공!:"+hotel_dto_list.get(0).getHotel_name();
				
				int hotel_no=hotel_dto_list.get(0).getHotel_no();
				Map<String,String> maps=new HashMap<String,String>();
				maps.put("user_id", session.getAttribute("id").toString());
				maps.put("h_a_no", "h_"+hotel_no);
				plannerService.insertRes(maps);
				
			}
		}
		else {
			if(hotelService.updateHotelInfo(map)) {
				city_name+=":호텔 예약이 변경 되었습니다.:"+hotel_dto_list.get(0).getHotel_name();
			};
		}
		
		
		
		return city_name;
	}
}