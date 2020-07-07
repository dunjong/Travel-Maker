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
	  	Map cityIataCodeMap = new HashMap();
	  	//data에 왕복티켓1매의 전체정보가 저장되어있음(data[max값],최대갯수는 아마데우스클래스의 인자max로 결정)
        for (FlightOfferSearch data : flightOffersSearches) {
	  		for (int k=0;k<data.getItineraries().length;k++) {
	  			//출발에서 도착까지 걸리는 시간
	  			String originToDestTime = data.getItineraries()[k].getDuration();
	  			//도착에서 출발까지 걸리는 시간
  				String DestToOriginTime = data.getItineraries()[k].getDuration();
  				//출발시간
  				String startTime = data.getItineraries()[k].getSegments()[0].getDeparture().getAt();
  				//도착시간
  				String endTime = data.getItineraries()[k].getSegments()[data.getItineraries()[k].getSegments().length-1].getArrival().getAt();
	  			//경유 횟수는 segments갯수로 계산함
	  			int gyeongUCount = data.getItineraries()[k].getSegments().length - 1;
	  			cityIataCodeMap = new HashMap();
	  			//출발-경유-도착까지의 도시이름, 도착-경유-출발까지의 도시이름을 맵에 전부저장 : key값은 0부터시작하는 i값
	  			for (int i=0;i < data.getItineraries()[k].getSegments().length;i++) {
	  				//출발지,경유지들 iataCode 한번씩 저장
	  				cityIataCodeMap.put(i,data.getItineraries()[k].getSegments()[i].getDeparture().getIataCode());
	  				if(i==data.getItineraries()[k].getSegments().length)
	  					//마지막segment의 출발지를 입력할때 도착지까지입력
	  					//즉 첫번째 방에 출발지, 마지막 방에 도착지 중간방에 경유지들을 저장
	  					cityIataCodeMap.put(i+1,data.getItineraries()[k].getSegments()[i].getArrival().getIataCode());
	  			}
	  			//출발에서 도착까지 필요한 정보들
	  			segmentsList = new Vector();
	  			segmentsList.add(originToDestTime);
	  			segmentsList.add(DestToOriginTime);
	  			segmentsList.add(startTime);
	  			segmentsList.add(endTime);
	  			segmentsList.add(gyeongUCount);
	  			segmentsList.add(cityIataCodeMap);
		  		itineraryMap.put("segmentsList"+k,segmentsList);
	  		}
	  		//왕복티켓하나에서 필요한 정보들
	  		itineraryMap.put("totalPrice",Double.toString(data.getPrice().getTotal()));
	  		itineraryMap.put("basePrice",Double.toString(data.getPrice().getBase()));
	        dataList.add(itineraryMap);
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