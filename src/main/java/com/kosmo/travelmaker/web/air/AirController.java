package com.kosmo.travelmaker.web.air;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

@Controller
@RequestMapping("/TravelMaker/")
public class AirController {

	@RequestMapping("AirSearch.kosmo")
	public String AirSearch() {
		return "air/AirSearch.tiles";
	}
	
	//아마데우스 API 사용을 위한 자바 구문 
	@RequestMapping("AirList.kosmo")
	public String AirList() throws ResponseException {
		Amadeus amadeus = Amadeus
	            .builder("wmBCJo8VFo4AFp3nqXxlWbHWdZH8VqwP", "0Of0WvaAGgzG8pym")
	            .build();

		FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
                Params.with("originLocationCode", "SEL")
                        .and("destinationLocationCode", "LON")
                        .and("departureDate", "2020-06-11")
                        .and("returnDate", "2020-06-13")
                        .and("adults", 2)
                        .and("max", 2));
		System.out.println(flightOffersSearches[0]);
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
