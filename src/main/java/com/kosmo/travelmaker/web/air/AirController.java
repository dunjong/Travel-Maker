package com.kosmo.travelmaker.web.air;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;
import com.amadeus.resources.FlightOfferSearch.Itinerary;
import com.amadeus.resources.FlightOfferSearch.SearchPrice;
import com.amadeus.resources.FlightOfferSearch.SearchSegment;
import com.amadeus.resources.FlightPrice;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/TravelMaker/")

public class AirController {
	//api키 properties에서 가져오기
	@Value("${SkyscannerAirportAutoCompleteApiKey}")
	private String AutoCompleteApiKey;
	@Value("${AmadeusFlightApiKey}")
	private String AmadeusFlightApiKey;
	@Value("${AmadeusFlightSecretApiKey}")
	private String AmadeusFlightSecretApiKey;
	// 아마데우스 API 사용을 위한 자바 구문
	@RequestMapping("AirSearch.kosmo")
	public String AirSearch(@RequestParam Map map, Model model) throws ResponseException {
		String departure = map.get("departure").toString();
		String arrival = map.get("arrival").toString();
		Amadeus amadeus = Amadeus.builder(AmadeusFlightApiKey, AmadeusFlightSecretApiKey).build();
		//segments[0]이 출발~경유,segments[1]이 경유~도착
		FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
				Params.with("originLocationCode", departure)
				.and("destinationLocationCode", arrival)
				.and("departureDate", map.get("departureDate"))
				.and("returnDate", map.get("returnDate"))
				.and("adults", Integer.parseInt((String)map.get("adult")))
				.and("max", 5)
				.and("currencyCode", "KRW")
				.and("children", map.get("children")==""?0:Integer.parseInt((String)map.get("children"))));
  		//왕복티켓1번의 출발에서 도착까지
  		//경유 1회일 시 아래의 코드가 왕복티켓(iter[0]과 iter[1])의 출발과 경유
		System.out.println("경유1회일시 출발에서 (경유포함)도착까지 의 결과값");
		System.out.println("출발"+flightOffersSearches[0].getItineraries()[0].getSegments()[0].getDeparture().getIataCode());
		System.out.println("경유"+flightOffersSearches[0].getItineraries()[0].getSegments()[0].getArrival().getIataCode());
		//경유 1회일 시 아래의 코드가 왕복티켓(iter)의 경유와 도착
		System.out.println("경유"+flightOffersSearches[0].getItineraries()[0].getSegments()[1].getDeparture().toString());
		System.out.println("도착"+flightOffersSearches[0].getItineraries()[0].getSegments()[1].getArrival().toString());
		System.out.println("--------------------------");
		//왕복 티켓1번의 도착에서 출발까지
		System.out.println("경유1회일시 도착에서 (경유포함)출발까지 의 결과값");
	  	//경유 1회일 시 아래의 코드가 왕복티켓(iter)의 도착과 경유
	  	System.out.println("출발"+flightOffersSearches[0].getItineraries()[1].getSegments()[0].getDeparture());
	  	System.out.println("경유"+flightOffersSearches[0].getItineraries()[1].getSegments()[0].getArrival());
	  	//경유 1회일 시 아래의 코드가 왕복티켓(iter)의 경유와 출발
	  	System.out.println("경유"+flightOffersSearches[0].getItineraries()[1].getSegments()[1].getDeparture().toString());
	  	System.out.println("도착"+flightOffersSearches[0].getItineraries()[1].getSegments()[1].getArrival().toString());
	  	//왕복티켓1번의 가격구하기 동행전체에대한 가격
	  	System.out.println("전체가격"+flightOffersSearches[0].getPrice().getTotal());
	  	System.out.println("기본가격"+flightOffersSearches[0].getPrice().getBase());
		//출발지에서 도착지 총 비행시간
		System.out.println("출발지-도착지 총 비행시간"+flightOffersSearches[0].getItineraries()[0].getDuration());
	  	//도착지에서 출발지 총 비행시간
	  	System.out.println("출발지-도착지 총 비행시간"+flightOffersSearches[0].getItineraries()[1].getDuration());
	  	//segment한개를 맵에담는다(출발지 - 경유지)
	  	//segments를 리스트에담는다 (출발지 - 경유지 - 도착지)
	  	//segments와 itinerary를 맵에 담는다 (출발:도착,도착:출발,티켓전체에 대한 정보)
	  	List<Map> dataList = new Vector<Map>();
	  	Map itineraryMap = new HashMap();
	  	List segmentsList = new Vector();
	  	Map segmentMap = new HashMap();
	  	//data에 왕복티켓1매의 전체정보가 저장되어있음(data[max값],최대갯수는 아마데우스클래스의 인자max로 결정)
        for (FlightOfferSearch data : flightOffersSearches) {
        	segmentsList = new Vector();
  			//itinerary[0]출발지에서 경유몇회거쳐서 도착지까지
        	//itinerary[1]도착지에서 경유몇회거쳐서 출발지까지 즉 itinerary는 2개로 고정
        	//티켓의 가격정보저장
        	double totalPrice = flightOffersSearches[0].getPrice().getTotal();
        	double basePrice = flightOffersSearches[0].getPrice().getBase();
	  		for (Itinerary itinerary : data.getItineraries()) {
	  			segmentMap = new HashMap();
	  			//출발에서 도착까지 걸리는 시간
	  			String originToDestTime = itinerary.getDuration();
	  			//도착에서 출발까지 걸리는 시간
  				String DestToOriginTime = itinerary.getDuration();
  				//출발시간
  				String startTime = itinerary.getSegments()[0].getDeparture().getAt();
  				//도착시간
  				String endTime = itinerary.getSegments()[itinerary.getSegments().length].getArrival().getAt();
	  			//경유 횟수는 segments갯수로 계산함
	  			int gyeongUCount = itinerary.getSegments().length - 1;
	  			for (int i=0;i < itinerary.getSegments().length;i++) {
	  				//출발지,경유지들 iataCode 한번씩 저장
	  				segmentMap.put(i,itinerary.getSegments()[i].getDeparture().getIataCode());
	  				if(i==itinerary.getSegments().length)
	  					//마지막segment의 출발지를 입력할때 도착지까지입력
	  					//즉 첫번째 방에 출발지, 마지막 방에 도착지 중간방에 경유지들을 저장
	  					segmentMap.put(i+1,itinerary.getSegments()[i].getArrival().getIataCode());
	  			}
	  			segmentsList.add(originToDestTime);
	  			segmentsList.add(DestToOriginTime);
	  			segmentsList.add(startTime);
	  			segmentsList.add(endTime);
	  			segmentsList.add(gyeongUCount);
	  			segmentsList.add(segmentMap);
	  		}
	  		itineraryMap.put("totalPrice",Double.toString(totalPrice));
	  		itineraryMap.put("basePrice",Double.toString(basePrice));
	  		itineraryMap.put("segmentsList",segmentsList);
	  	}
        model.addAttribute("list", dataList);
        model.addAttribute("AutoCompleteApiKey",AutoCompleteApiKey);
        return "air/AirList.tiles";
	}
	
	@RequestMapping("AirList.kosmo")
	public String AirList(Model model) {
		model.addAttribute("AutoCompleteApiKey",AutoCompleteApiKey);
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