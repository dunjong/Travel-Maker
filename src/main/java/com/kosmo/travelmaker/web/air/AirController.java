package com.kosmo.travelmaker.web.air;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

@Controller
@RequestMapping("/TravelMaker/")
public class AirController {

	@RequestMapping("AirSearch.kosmo")
	public String AirSearch(@RequestParam Map map,Model model) throws ResponseException {
		System.out.println("map"+map.get("departure"));
		Amadeus amadeus = Amadeus
	            .builder("wmBCJo8VFo4AFp3nqXxlWbHWdZH8VqwP", "0Of0WvaAGgzG8pym")
	            .build();

		FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
                Params.with("originLocationCode", map.get("departure").toString())
                        .and("destinationLocationCode", map.get("departure").toString())
                        .and("departureDate", map.get("departureDate").toString())
                        .and("returnDate", map.get("returnDate").toString())
                        .and("adults", map.get("adult").toString())
                        .and("max",  map.get("children").toString()));
		System.out.println(flightOffersSearches[0]);
		model.addAttribute("flightOffersSearches",flightOffersSearches);
		return "air/AirList.tiles";
	}
	
	//아마데우스 API 사용을 위한 자바 구문 
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
